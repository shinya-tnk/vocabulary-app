# frozen_string_literal: true

class VocabulariesController < ApplicationController
  def index
    @vocabularies = Vocabulary.all
  end

end
