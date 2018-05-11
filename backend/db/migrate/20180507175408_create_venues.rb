class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :songkick_id
      t.string :name
      t.text :songkick_url
      t.string :phone
      t.string :street
      t.string :city
      t.integer :city_id
      t.string :state_code
      t.integer :zip
      t.text :website
      t.integer :capacity
      t.text :description
      t.integer :songkick_metro
      t.decimal :lat
      t.decimal :long
      t.text :songkick_img

      t.timestamps
    end
  end
end
