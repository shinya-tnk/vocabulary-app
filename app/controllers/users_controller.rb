class UsersController < ApplicationController
  def show
    @vocabularies = Vocabulary.where(user_id: current_user.id).page(params[:page]).per(8).order(created_at: :desc)
  end
end
