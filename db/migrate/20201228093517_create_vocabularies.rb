# frozen_string_literal: true

class CreateVocabularies < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabularies do |t|
      t.string :word, null: false
      t.string :description1, null: false
      t.string :description2
      t.string :description3
      t.string :description4
      t.string :description5
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
