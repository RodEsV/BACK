class Api::V1::ProductsController < ApplicationController
  respond_to :json
  before_action :set_product, only: [:show, :edit, :update, :destroy,
                                     :add_tag, :remove_tag]

  # GET /products
  # GET /products.json
  def index
    respond_with Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_with Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    my_type = Type.find_by_id(params[:type])
    my_category = Category.find_by_id(params[:category])
    respond_with :api, :v1, Product.create(name: params[:name],
                            image_link: params[:image_link],
                            type: my_type,
                            category: my_category,
                            updated_at: Time.now)
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def add_tag
    my_tag = Tag.find_by_id(params[:tag])
    if !@product.tags.include? my_tag
      @product.tags << my_tag
    end

    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def remove_tag
    my_tag = Tag.find_by_id(params[:tag])
    if @product.tags.include? my_tag
      @product.tags.destroy(my_tag)
    end

    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if @product.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product, {})
    end

end
