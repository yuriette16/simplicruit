class CategoriesController < ApplicationController

  def create
    @category = Category.new(email_template_params)
    authorize @category
    @category.save
    redirect_to category_questions_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
