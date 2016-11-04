class UserSerializer < ActiveModel::Serializer
  attributes :id, :provider, :uid, :name, :email, :auth_token
  #has_many :sales
end
