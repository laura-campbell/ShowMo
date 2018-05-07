class CreateAttends < ActiveRecord::Migration[5.1]
  def change
    create_table :attends do |t|
      t.references :user, foreign_key: true
      t.references :show, foreign_key: true
      t.float :rating
      t.boolean :checkin

      t.timestamps
    end
  end
end
