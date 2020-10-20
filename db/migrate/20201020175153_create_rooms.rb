class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :monster_id
      t.boolean :exit
    end
  end
end