class Api::V1::UsersController < ApplicationController
  respond_to :json
  def index
    respond_with User.all
  end
  def show
    respond_with User.find(params[:id])
  end

  def login
    if params.key?('email') && params.key?('user_password')
      @user = User.where("email=?",params['email']).first()
      if @user
        if @user.valid_password?(params['user_password'])
        render json: @user, status:200
        else
          render json: {errors: "Invialid username or password"}, status: 422
        end
      else
        render json: {errors: "Invialid username or password"}, status: 422
      end
    else
      render json: { errors: "Your request failed, please try again" }, status: 422
    end
  end

end
