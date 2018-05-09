class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :api_venue_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :state_code
      t.integer :zip
      t.string :url
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
