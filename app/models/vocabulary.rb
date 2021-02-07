class Vocabulary < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :word, format: {
      with: /\A^[a-zA-Z]+$\z/
    }
    validates :description1
  end

  def self.search(search)
    if search != ''
      Vocabulary.where('word LIKE(?)', "%#{search}%")
    else
      Vocabulary.where(user_id: 0)
    end
  end
end
