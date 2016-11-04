class Api::V1::CartsController < ApplicationController
  respond_to :json
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :add, :remove]
  #before_action :authenticate_user!
  # before_action :isAdmin, only:[:create,:update,:destroy]

  # GET /roles
  # GET /roles.json
  def index
    respond_with Cart.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    respond_with @cart
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
    @cart = Cart.new(user: my_user, updated_at: Time.now)
    @cart.save
    respond_with :api, :v1, @cart
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def add
    my_subproduct = Subproduct.find_by_id(params[:subproduct])
    if @cart.subproducts.include? my_subproduct
      init_cart_sub(@cart, my_subproduct)
      @cart_subproduct.increment(:quantity, 1)
    else
      init_cart_sub(@cart, my_subproduct)
      add_a_subproduct(my_subproduct)
      init_cart_sub(@cart, my_subproduct)
      @cart_subproduct.increment(:quantity, 1)
      # @cart_subproduct = CartSubproduct.create(quantity: 1, cart: @cart, subproduct: my_subproduct)
    end

    if @cart.save && @cart_subproduct.save
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def remove
    my_subproduct = Subproduct.find_by_id(params[:subproduct])
    if @cart.subproducts.include? my_subproduct
      init_cart_sub(@cart, my_subproduct)
      if @cart_subproduct.quantity >= 1
        @cart_subproduct.update_attribute(:quantity, @cart_subproduct.quantity - 1)
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end

    if @cart.save && @cart_subproduct.save
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
      my_user = User.find(params[:user_id])
      @cart = Cart.find_by(cart_owner: my_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.permit(:name)
    end

    def init_cart_sub(cart, subproduct)
      @cart_subproduct = CartSubproduct.find_by(cart: cart, subproduct: subproduct)
    end

    def add_a_subproduct(subproduct)
      @cart.subproducts << subproduct
      if !@cart.save
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
end
