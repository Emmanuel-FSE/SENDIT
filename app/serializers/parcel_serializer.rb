class ParcelSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :parcel_name, :pickup_location, :destination, :weight, :price
  has_one :status
  belongs_to :user
end
