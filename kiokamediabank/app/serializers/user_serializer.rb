class UserSerializer < ActiveModel::Serializer
  attributes :id, :provider, :uid, :name, :email, :auth_token, :admin
  #has_many :sales
end
