class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :guest_id
      t.integer :invitation_id
      t.date    :received_on
      t.boolean :is_attending
      t.string  :meal_type

      t.timestamps null: false
    end
  end
end
