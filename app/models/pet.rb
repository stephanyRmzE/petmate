class Pet < ApplicationRecord
  CATEGORY = %w[Dog Cat Bird Reptil Rodent]
  has_many :reservations
  belongs_to :user
  has_one_attached :photo
end
