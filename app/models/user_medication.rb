class UserMedication < ApplicationRecord
  belongs_to :medication
  belongs_to :user
  has_many :refills
  has_many :notifications, dependent: :destroy
end
