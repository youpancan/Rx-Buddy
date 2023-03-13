class Refill < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user_medication
  has_one :notification
  enum status: { pending: 0, received: 1, in_process: 2, complete: 3 }
  enum urgency: { not_urgent: 0, medium: 1, urgent: 2, not_specified: 3 }
  # declare enum and change status & urgency to integer
  # dashboard should show that a refill instance has been made
  # maybe add status in order which depends on the refill status for all refills
end
