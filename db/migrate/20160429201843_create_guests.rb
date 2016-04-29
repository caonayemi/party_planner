class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string  :title
      t.string  :first_name
      t.string  :last_name
      t.string  :priority
      t.boolean :is_head_of_household
      t.boolean :is_partner
      t.string  :age_group
      t.string  :address_line_1
      t.string  :address_line_2
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :country, default: "United States"

      t.timestamps null: false
    end
  end
end
