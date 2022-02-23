class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :pets, dependent: :destroy
  has_many :received_reservations, through: :pets, source: :reservations
  has_many :sent_reservations, class_name: "Reservation"
  validates :first_name, presence: true
  validates :last_name, presence: true
end
