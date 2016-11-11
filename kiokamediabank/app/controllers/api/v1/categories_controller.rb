class Api::V1::CategoriesController < ApplicationController
  respond_to :json
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only:[:create,:update,:destroy]

  # GET /categories
  # GET /categories.json
  def index
    respond_with Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    respond_with Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params.permit(:name))

    if @category.save
      respond_with :api, :v1, @category #render :show, status: :created, location: api_v1_category_url(@category)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render :show, status: :ok, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if @category.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.fetch(:category, {})
    end

end
