class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.string  :titles
      t.string  :first_names
      t.string  :family_name
      t.string  :additional_guests
      t.date    :sent_on
      t.string  :gifts
      t.date    :thank_you_sent_on

      t.timestamps null: false
    end
  end
end
