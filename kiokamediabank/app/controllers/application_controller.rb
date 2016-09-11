class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

#  protected
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:provider,:name,:role])
#  end

#  def authenticate_user!(*args)
#    current_user.present? || super(*args)
#  end

  #retorna el usuario logueado. si no existe, busca o crea un nuevo usuario anonimo con un token unico
#  def current_user
#    super || AnonymousUser.find_or_initialize_by_token(anonymous_user_token).tap do |user|
#      user.save(validate: false) if user.new_record?
#    end
#  end

  #retorna un identificador unico asociado a la sesion actual, que dura mientras este activa la sesion
#  private
#  def anonymous_user_token
#    session[:user_token] ||= SecureRandom.hex(8)
#  end

end
