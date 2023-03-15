class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_medications
  has_many :user_allergies
  has_many :allergies, through: :user_allergies
  has_many :refills, through: :user_medications
  has_many :medications, through: :user_medications

  # Multiple has_many :through--start
  has_many :orders
  has_many :refills, through: :orders
  has_many :notifications, through: :refills
  has_many :no_order_refills, through: :user_medications, source: :no_order_refills
  # Multiple has_many :through--end

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :birthdate, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true

  has_many :chatbots

  geocoded_by :pharmacy_location
  after_validation :geocode, if: :will_save_change_to_pharmacy_location?

  def check_for_contraindications
    allergies.each do |allergy|
      medications.each do |med|
        if med.ingredients.split.include?(allergy.allergy_type)
          return med
        end
      end
    end
    return nil
  end
end
