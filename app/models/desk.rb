class Desk < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :photo, presence: true



  mount_uploader :photo, PhotoUploader
end
