class UserSerializer < ActiveModel::Serializer
  attributes :provider, :uid, :name, :email, :auth_token
  #has_many :sales
end
