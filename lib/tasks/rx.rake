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
    Order.last.refills.last.complete!
  end

  desc "update the refills status to picked up"
  task picked_up: :environment do
    Order.last.refills.last.picked_up!
  end
end
