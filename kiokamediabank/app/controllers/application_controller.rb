class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_sessions
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:provider,:name,:password,:first_name,:last_name,:image])
  end

  def isAdmin
    unless current_user.admin
      return render json: {
          errors: ["Authorized users only."]
      }, status: 401
    end
  end

#  def authenticate_user!(*args)
#    current_user.present? || super(*args)
#  end

  #retorna el usuario logueado. si no existe, busca o crea un nuevo usuario anonimo con un token unico
#  def current_user
#    super || AnonymousUser.find_or_initialize_by_token(anonymous_user_token).tap do |user|
#      user.save(validate: false) if user.new_record?
#    end
#  end

end
