class UserMedication < ApplicationRecord
  belongs_to :medication
  belongs_to :user
  has_many :refills
  has_many :no_order_refills, -> { where order_id: nil }, class_name: 'Refill'
  has_many :notifications, dependent: :destroy
end
