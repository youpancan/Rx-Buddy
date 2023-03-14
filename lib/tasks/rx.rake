namespace :rx do
  desc "update the refills status to received "
  task received: :environment do
    Order.last.refills.last.received!
  end

  desc "update the refills status to in process"
  task in_process: :environment do
    Order.last.refills.last.in_process!
  end

  desc "update the refills status to complete"
  task complete: :environment do
    refill = Order.last.refills.last
    refill.complete!
    user = refill.user_medication.user
    message = "your #{refill.user_medication.medication.name} is ready for pick up!"
    notification = Notification.new(refill: refill, message: message)
    if notification.save!
      UserChannel.broadcast_to(
        user,
        notification.message
      )
    end
  end

  desc "update the refills status to picked up"
  task picked_up: :environment do
    Order.last.refills.last.picked_up!
  end
end
