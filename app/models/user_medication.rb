class UserMedication < ApplicationRecord
  belongs_to :medication
  belongs_to :user
  has_many :refills
  has_many :no_order_refills, -> { where order_id: nil }, class_name: 'Refill'

  def can_refill?
    number_refills.positive? && (refill_due_date - 5) <= Date.today && refills.last.picked_up?
  end
end
