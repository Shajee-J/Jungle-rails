class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category deleted successfully.'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
