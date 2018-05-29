class Booking < ApplicationRecord
  has_one :user
  has_one :desk
end
