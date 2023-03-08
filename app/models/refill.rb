class Refill < ApplicationRecord
  belongs_to :order
  belongs_to :user_medication
end
