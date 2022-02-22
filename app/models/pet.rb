class Pet < ApplicationRecord
  CATEGORY = %w[Dogs Cats Birds Reptiles Rodents]
  has_many :reservations
  has_one_attached :photo
end
