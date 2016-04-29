class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date   :to_be_held_on
      t.date   :send_invitations_by
      t.date   :rsvps_due_on

      t.timestamps null: false
    end
  end
end
