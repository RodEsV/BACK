class AdminSerializer < ActiveModel::Serializer
  attributes :provider, :uid, :first_name, :last_name, :email, :auth_token
  #has_many :sales
end
