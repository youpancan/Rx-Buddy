class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_medications
  has_many :notifications, through: :user_medications
  has_many :orders
  has_many :user_allergies
  has_many :refills, through: :user_medications
  has_many :no_order_refills, through: :user_medications, source: :no_order_refills

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :birthdate, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true

  geocoded_by :pharmacy_location
  after_validation :geocode, if: :will_save_change_to_pharmacy_location?
end
