class Api::V1::SubproductsController < ApplicationController
  respond_to :json
  before_action :set_subproduct, only: [:show, :edit, :update, :destroy]

  # GET /subproducts
  # GET /subproducts.json
  def index
    respond_with Subproduct.all
  end

  # GET /subproducts/1
  # GET /subproducts/1.json
  def show
    respond_with Subproduct.find(params[:id])
  end

  # GET /subproducts/new
  def new
    @subproduct = Subproduct.new
  end

  # GET /subproducts/1/edit
  def edit
  end

  # POST /subproducts
  # POST /subproducts.json
  def create
    my_product = Product.find_by_id(params[:product])
    respond_with :api, :v1, my_product, Subproduct.create(resolution: params[:resolution],
                            price: params[:price],
                            product: my_product,
                            updated_at: Time.now)
  end

  # PATCH/PUT /subproducts/1
  # PATCH/PUT /subproducts/1.json
  def update
    @subproduct = Subproduct.find(params[:id])
    if @subproduct.update(product_params)
      render :show, status: :ok, location: @subproduct
    else
      render json: @subproduct.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subproducts/1
  # DELETE /subproducts/1.json
  def destroy
    @subproduct = Subproduct.find(params[:id])
    @subproduct.destroy
    if @subproduct.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subproduct
      @subproduct = Subproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subproduct_params
      params.fetch(:subproduct, {})
    end

end
