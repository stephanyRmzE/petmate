class Pet < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_one_attached :photo
end
