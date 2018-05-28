class Desk < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true

  belongs_to :user
end
