class Api::V1::TagsController < ApplicationController
  respond_to :json
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only:[:create,:update,:destroy]

  # GET /tags
  # GET /tags.json
  def index
    respond_with Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    respond_with Tag.find(params[:id])
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)#params.permit(:name))

    if @tag.save
      respond_with :api, :v1, @tag #render :show, status: :created, location: api_v1_tag_url(@tag)
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      render :show, status: :ok, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    if @tag.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.permit(:name)
    end
end
