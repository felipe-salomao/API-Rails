class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    categories = Categories::List.new(params).execute

    render json: categories, meta: pagination(categories), each_serializer: CategorySerializer, status: :ok
  end

  def show
    render json: @category, serializer: CategorySerializer, list_comments: true, status: :ok
  end

  def create
    @category = Categories::Create.new(category_params).execute

    render json: @category, serializer: CategorySerializer, status: :created
  end

  def update
    @category.update!(category_params)

    render json: @category, serializer: CategorySerializer, status: :ok
  end

  def destroy
    @category.destroy!

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
