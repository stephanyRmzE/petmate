class Pet < ApplicationRecord
  CATEGORY = %w[Dog Cat Bird Reptile Rodent]
  has_many :reservations
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :age, presence: true
  validates :species, presence: true
  validates :breed, presence: true
end
