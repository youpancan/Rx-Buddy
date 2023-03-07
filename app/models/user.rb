class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :birth_date, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true

  has_many :user_medications
  has_many :orders
end
