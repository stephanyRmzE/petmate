class Reservation < ApplicationRecord
  belongs_to :pets
  belongs_to :user
end
