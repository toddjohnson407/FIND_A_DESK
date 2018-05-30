class Rate < ApplicationRecord
  before_destroy :check

  has_many :desks, dependent: :destroy
  validates :pricing, presence: true, uniqueness: true

  private

  def check
    if self.desks.any?
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
