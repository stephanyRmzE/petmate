class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :pet, uniqueness: { scope: :start_date }
  validates :pet, uniqueness: { scope: :end_date }
end
