class Order < ApplicationRecord
  # belongs_to :user_medication
  has_many :refills
  belongs_to :user_medication
  belongs_to :user
end
