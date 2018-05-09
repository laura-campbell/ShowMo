class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.references :artist, foreign_key: true
      t.references :venue, foreign_key: true
      t.string :date
      t.string :time
      t.datetime :showtime
      t.integer :songkick_id
      t.float :songkick_popularity
      t.text :songkick_url

      t.timestamps
    end
  end
end
