class Parcel < ApplicationRecord
  belongs_to :user
  has_one :status

  validates :parcel_name, presence: true
  validates :weight, presence: true
  validates :price, presence: true
  validates :pickup_location, presence: true
  validates :destination, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
