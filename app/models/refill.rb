class Refill < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user_medication
  has_one :notification
  enum status: { pending: 0, received: 1, in_process: 2, complete: 3, picked_up: 4 }
  enum urgency: { not_urgent: 0, medium: 1, urgent: 2, not_specified: 3 }
  # when we put picked_up!, the refill due date for medication should be 30 days from now
  # and amount of refills should decrease by 1
  def pick_up_and_set_refill_date
    picked_up!
    user_medication.refill_due_date = Date.today + 30
    user_medication.number_refills -= 1
    user_medication.save
  end
end
