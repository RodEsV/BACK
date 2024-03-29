class Api::V1::SalesController < Api::V1::ApiController
  respond_to :json
  before_action :set_variables, only: [:show, :list_mine, :create]

  before_action :authenticate_user!
  before_action :isAdmin, only: [:index, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    respond_with Sale.all
  end

  def list_mine
    if current_user != @user
      render json: {"Status": 401, "Message": "No son tus ventas, marica!"}, status: :unauthorized
    end
    respond_with @sales
  end
  # GET /roles/1
  # GET /roles/1.json
  def show
    respond_with Sale.find(params[:id])
  end

  # GET /roles/new
  def new
    @role = Sale.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    if current_user != @user
      render json: {"Status": 401, "Message": "No es tu carrito que quieres comprar, marica!"}, status: :unauthorized
    end

    @sale = Sale.new(price: @cart.compute_price,
                      buyer: @cart.cart_owner, updated_at: Time.now)
    @sale.subproducts << @cart.subproducts
    @sale.save

    for subproduct in @sale.subproducts
      cart_subproduct = CartSubproduct.find_by(cart: @cart, subproduct: subproduct)
      sale_subproduct = SaleSubproduct.find_by(sale: @sale, subproduct: subproduct)
      sale_subproduct.quantity = cart_subproduct.quantity
      sale_subproduct.save
    end
    @cart.subproducts.clear
    @cart.save

    respond_with :api, :v1, @sale
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      render :show, status: :ok, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @sale.destroy
    if @sale.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variables
      @user = User.find(params[:user_id])
      @sales = Sale.where(buyer: @user)
      @cart = Cart.find_by(cart_owner: @user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.permit(:name)
    end
end
