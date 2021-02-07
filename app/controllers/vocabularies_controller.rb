class VocabulariesController < ApplicationController
  def index
    @vocabularies = Vocabulary.where(user_id: [current_user.id, 1]).sample(20) if user_signed_in?
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def create
    @vocabulary = Vocabulary.new(vocabulary_params)
    if @vocabulary.save
      flash[:alert] = '単語を登録しました！'
      redirect_to action: :new
    else
      render :new
    end
  end

  def edit
    @vocabulary = Vocabulary.find(params[:id])
  end

  def update
    vocabulary = Vocabulary.find(params[:id])
    vocabulary.update(vocabulary_params)
    redirect_to '/users/show'
  end


  private

  def vocabulary_params
    params.require(:vocabulary).permit(:word, :description1, :description2, :description3, :description4, :description5).merge(user_id: current_user.id)
  end
end
