class Desk < ApplicationRecord
  belongs_to :user
  belongs_to :rate
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true

  #validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
