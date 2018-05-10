class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :songkick_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :state_code
      t.integer :zip
      t.integer :songkick_metro
      t.string :songkick_url
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
