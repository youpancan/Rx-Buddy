class Refill < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user_medication
  enum :status, [ :pending, :received, :in_process, :complete ]
  # declare enum and change status & urgency to integer
  # dashboard should show that a refill instance has been made
  # maybe add status in order which depends on the refill status for all refills
end
