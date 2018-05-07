class CreateSetlists < ActiveRecord::Migration[5.1]
  def change
    create_table :setlists do |t|
      t.text :content
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
