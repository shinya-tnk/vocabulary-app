class User < ApplicationRecord
  has_many :sns_credentials
  has_many :vocabularies

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.from_omniauth(auth)
    # 以前にSNSログインしたことがあればそれを検索して取得
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # 初めてのSNSログインならばemailで検索して同じアドレスがあれば取得
    # なければ作成(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  end
end
