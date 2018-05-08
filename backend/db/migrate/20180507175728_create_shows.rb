class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.references :artist, foreign_key: true
      t.references :venue, foreign_key: true
      t.datetime :showtime
      t.integer :api_show_id

      t.timestamps
    end
  end
end
