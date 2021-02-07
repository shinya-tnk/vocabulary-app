class UsersController < ApplicationController
  def show
    @vocabularies = Vocabulary.where(user_id: [current_user.id, 1]).order(created_at: :desc)
  end
end
