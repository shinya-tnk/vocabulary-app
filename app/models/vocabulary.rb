class Vocabulary < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :word, format: {
      with: /\A^[a-zA-Z]+$\z/
    }
    validates :description1
  end

end
