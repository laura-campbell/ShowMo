class CreateFans < ActiveRecord::Migration[5.1]
  def change
    create_table :fans do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
