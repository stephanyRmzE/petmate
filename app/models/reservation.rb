class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :pet, uniqueness: { scope: :start_date }
  validates :pet, uniqueness: { scope: :end_date }
  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
