class Api::V1::UsersController < Api::V1::ApiController
  respond_to :json
  def index
    respond_with User.all
  end
  def show
    respond_with User.find(params[:id])
  end
end
