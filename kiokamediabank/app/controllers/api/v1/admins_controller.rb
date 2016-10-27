class Api::V1::AdminsController < ApplicationController
  respond_to :json
  def index
    respond_with Admin.all
  end
  def show
    respond_with Admin.find(params[:id])
  end
end
