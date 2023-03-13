class AddRefillToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :refill, null: false, foreign_key: true
  end
end
