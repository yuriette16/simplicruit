class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :update]
  def index
    @questions = policy_scope(Question)
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(questions_params)
    authorize @question
    @question.save
    redirect_to questions_path
  end

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
    authorize @question
  end

  def questions_params
    params.require(:question).permit(:question, :category)
  end

end
