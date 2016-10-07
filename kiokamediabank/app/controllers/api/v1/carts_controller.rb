class Api::V1::CartsController < ApplicationController
  respond_to :json
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # before_action :isAdmin, only:[:create,:update,:destroy]

  # GET /roles
  # GET /roles.json
  def index
    respond_with Cart.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    respond_with Cart.find(params[:id])
  end

  # GET /roles/new
  def new
    @role = Cart.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    my_user = User.find_by_id(params[:user])
    my_subproduct = Subproduct.find_by_id(params[:subproduct])
    @cart = Cart.new(date: params[:date], user: my_user, updated_at: Time.now)
    @cart.subproducts << my_subproduct
    @cart.save
    respond_with :api, :v1, @cart
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @cart.subproducts << Subproduct.find_by_id(params[:subproduct])
    if @cart.save
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @cart.destroy
    if @cart.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.permit(:name)
    end
end
