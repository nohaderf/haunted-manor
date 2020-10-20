class CreateVisitedRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :visited_rooms do |t|
      t.integer :player_id
      t.integer :room_id
    end
  end
end