class Api::V1::SalesController < ApplicationController
  respond_to :json
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  # before_action :isAdmin, only:[:create,:update,:destroy]

  # GET /roles
  # GET /roles.json
  def index
    respond_with Sale.all
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
    my_user = User.find_by_id(params[:user])
    respond_with :api, :v1, Sale.create(date: params[:date],
                            price: params[:price],
                            user: my_user,
                            updated_at: Time.now)
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
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.permit(:name)
    end
end
