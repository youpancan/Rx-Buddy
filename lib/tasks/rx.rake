namespace :rx do
  desc "update the refills status of first to received "
  task received: :environment do
    Order.last.refills.last.received!
    # maybe should receive all refill orders
  end

  desc "update the refills status second to received "
  task received_two: :environment do
    Order.last.refills[-2].received!
    # maybe should receive all refill orders
  end

  desc "update the refills status one to in process"
  task in_process: :environment do
    Order.last.refills.last.in_process!
    # maybe add another method to change the other refill status
  end

  desc "update the refills status two to in process"
  task in_process_two: :environment do
    Order.last.refills[-2].in_process!
    # maybe add another method to change the other refill status
  end

  desc "update the refills status one to complete"
  task complete: :environment do
    refill = Order.last.refills.last
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

  desc "update the refills status two to complete"
  task complete_two: :environment do
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
    Order.last.refills.last.pick_up_and_set_refill_date
  end

  desc "update the refills status two to picked up"
  task picked_up_two: :environment do
    Order.last.refills[-2].pick_up_and_set_refill_date
  end
  # maybe add another method to change the other refill status
end
