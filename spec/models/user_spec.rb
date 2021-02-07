# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべて存在する' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください', 'メールアドレスを正しく入力してください')
      end

      it 'emailが重複している' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに使用されています')
      end

      it 'emailが@を含んでいない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを正しく入力してください')
      end

      it 'passwordが空' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが5文字以下' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが全角' do
        @user.password = 'あいうえおかきくけこ'
        @user.password_confirmation = 'あいうえおかきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上英数字を含んだものを設定してください')
      end

      it 'passwordが存在してもpassword_confirmationが空' do
        @user.password = '1234abcd'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードがパスワードと一致していません')
      end
    end
  end
end
