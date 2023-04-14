class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :email, :user_type
  has_many :parcels
end
