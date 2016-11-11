class Api::V1::ApiController < ApplicationController
  # include DeviseTokenAuth::Concerns::SetUserByToken
  #
  # #protect_from_forgery with :null_session, prepend: true
  # before_action :authenticate_user_from_token!, only:[:create, :update, :destroy]
  #
  # private
  #   def authenticate_user_from_token!
  #     if !params.key?('api_token')
  #       head 401, content_type: "text/html"
  #     else
  #       @user = nil
  #       Users.all.each do |u|
  #         if Devise.secure_compare(u.auth_token, params['api_token'])
  #           @user = us
  #         end
  #     end
  #     end
  #   end

  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_sessions
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:provider,:name,:password,:first_name,:last_name,:image])
  end

  def isAdmin
    byebug
    uid = request.headers["uid"] || params["uid"]
    my_user = User.find_by(uid: uid)
    unless my_user.admin
      return render json: {
          errors: ["Authorized users only."]
      }, status: 401
    end
  end

end
