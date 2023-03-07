class Order < ApplicationRecord
  belongs_to :user_medication
  has_many :refills
end
