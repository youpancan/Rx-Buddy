class Order < ApplicationRecord
  # belongs_to :user_medication
  has_many :refills
  has_many :user_medications, through: :refills
  belongs_to :user
end
