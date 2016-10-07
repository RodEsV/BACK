class Api::V1::TypesController < ApplicationController
  respond_to :json
  before_action :set_type, only: [:show, :edit, :update, :destroy]
  # before_action :isAdmin, only:[:create,:update,:destroy]

  # GET /types
  # GET /types.json
  def index
    respond_with Type.all
  end

  # GET /types/1
  # GET /types/1.json
  def show
    respond_with Type.find(params[:id])
  end

  # GET /types/new
  def new
    @type = Type.new
  end

  # GET /types/1/edit
  def edit
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)#params.permit(:name))

    if @type.save
      respond_with :api, :v1, @type #render :show, status: :created, location: api_v1_type_url(@type)
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
      render :show, status: :ok, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    if @type.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_params
      params.permit(:name)
    end
end
