# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vocabulary, type: :model do
  before do
    @vocabulary = FactoryBot.build(:vocabulary)
  end

  describe '単語登録機能' do
    context '単語登録がうまくいくとき' do
      it 'すべて存在する' do
        expect(@vocabulary).to be_valid
      end

      it '意味②が空' do
        @vocabulary.description2 = nil
        expect(@vocabulary).to be_valid
      end

      it '意味③が空' do
        @vocabulary.description3 = nil
        expect(@vocabulary).to be_valid
      end

      it '意味④が空' do
        @vocabulary.description4 = nil
        expect(@vocabulary).to be_valid
      end

      it '意味⑤が空' do
        @vocabulary.description5 = nil
        expect(@vocabulary).to be_valid
      end
    end

    context '単語登録がうまくいかないとき' do
      it '単語が空' do
        @vocabulary.word = nil
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語を入力してください')
      end

      it '単語に全角が混ざっている' do
        @vocabulary.word = 'aaaＡＡＡ'
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語に数字が混ざっている' do
        @vocabulary.word = 'aaa111'
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語に日本語が混ざっている' do
        @vocabulary.word = 'aaaあああ'
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語に記号が混ざっている' do
        @vocabulary.word = "aaa!!\#$%&?"
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語が全角のみ' do
        @vocabulary.word = "ＡＡ\bＡＡＡＡ"
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語が数字のみ' do
        @vocabulary.word = '1111'
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語が日本語のみ' do
        @vocabulary.word = 'ああああああ'
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end

      it '単語が記号のみ' do
        @vocabulary.word = "!!\#$%&?"
        @vocabulary.valid?
        expect(@vocabulary.errors.full_messages).to include('英単語はアルファベットで入力してください')
      end
    end
  end
end
