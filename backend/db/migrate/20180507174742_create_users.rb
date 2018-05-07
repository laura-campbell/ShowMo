class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :location
      t.timestamps
    end
  end
end
