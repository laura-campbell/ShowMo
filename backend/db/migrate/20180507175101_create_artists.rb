class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :songkick_id
      t.text :songkick_url
      t.timestamps
    end
  end
end
