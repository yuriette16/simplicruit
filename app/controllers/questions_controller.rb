class QuestionsController < ApplicationController
  before_action :find_category, only: [:create]
  before_action :find_question, only: [:edit, :update]

  def index
    @questions = policy_scope(Question)
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    @question.category = @category
    authorize @question

    if @question.save
      redirect_to category_questions_path(@category)
    else
      redirect_to category_questions_path(@category)
      flash.alert = 'Sorry, something goes wrong!'
    end
  end

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to category_questions_path
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
    authorize @category
  end

  def find_question
    @question = Question.find(params[:id])
    authorize @question
  end

  def questions_params
    params.require(:question).permit(:question, :category_id)
  end

end
