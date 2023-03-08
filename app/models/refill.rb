class Refill < ApplicationRecord
  belongs_to :order
  belongs_to :user_medication
  # declare enum and change status to integer
  # change order_id in refill shcema
  # create new refill in dashboard
  # dashboard should show that a refill instance has been made
  # once done is pressed, figure out a way to show the refills medications
  # maybe add status in order which depends on the refill status for all refills
end
