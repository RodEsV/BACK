class Api::V1::TagsApiController < ApplicationController
  respond_to :json
  # before_action :isAdmin, only:[:create,:update,:destroy]

  before_action :tags_params,only:[:create,:update]
  def index
    respond_with Tag.all
  end

  def show
    respond_with Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      head 201, content_type: "text/html"
    else
      render json: {errors: @tag.errors}, status: 400
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      head 200, content_type: "text/html"
    else
      render json: {errors: @tag.errors}, status: 400
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy!
    if @tag.errors.any?
      head 204, content_type: "text/html"
    end
  end

end
