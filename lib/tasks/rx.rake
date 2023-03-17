namespace :rx do
  desc "update the refills status of first to received "
  task received: :environment do
    Order.last.refills.where.not(urgency: 'urgent').first.received!
    # maybe should receive all refill orders
  end

  desc "update the refills status urgent to received "
  task received_urgent: :environment do
    Order.last.refills.where(urgency: 'urgent').first.received!
    # maybe should receive all refill orders
  end

  desc "update the refills status one to in process"
  task in_process: :environment do
    Order.last.refills.where.not(urgency: 'urgent').first.in_process!
    # maybe add another method to change the other refill status
  end

  desc "update the refills status urgent to in process"
  task in_process_urgent: :environment do
    Order.last.refills.where(urgency: 'urgent').first.in_process_and_set_number_refills
    # maybe add another method to change the other refill status
  end

  desc "update the refills status one to complete"
  task complete: :environment do
    refill = Order.last.refills.where.not(urgency: 'urgent').first
    refill.complete!
    user = refill.user_medication.user
    message = "Your #{refill.user_medication.medication.name} is ready for pick up!"
    notification = Notification.new(refill: refill, message: message)
    if notification.save!
      UserChannel.broadcast_to(
        user,
        notification.message
      )
    end
    # maybe add another method to change the other refill status
  end

  desc "update the refills status urgent to complete"
  task complete_urgent: :environment do
    refill = Order.last.refills.where(urgency: 'urgent').first
    refill.complete!
    user = refill.user_medication.user
    message = "Your #{refill.user_medication.medication.name} is ready for pick up!"
    notification = Notification.new(refill: refill, message: message)
    if notification.save!
      UserChannel.broadcast_to(
        user,
        notification.message
      )
    end
    # maybe add another method to change the other refill status
  end

  desc "update the refills status one to picked up"
  task picked_up: :environment do
    Order.last.refills.where.not(urgency: 'urgent').first.pick_up_and_set_refill_date
  end

  desc "update the refills status urgent to picked up"
  task picked_up_urgent: :environment do
    Order.last.refills.where(urgency: 'urgent').first.pick_up_and_set_refill_date
  end
  # maybe add another method to change the other refill status
end
