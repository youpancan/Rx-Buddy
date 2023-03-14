class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :chatbot, null: false, foreign_key: true
      t.boolean :from_chatbot, null: false, default: false

      t.timestamps
    end
  end
end
