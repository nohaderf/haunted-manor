class RemoveVisitedRooms < ActiveRecord::Migration[6.0]
    def change
      drop_table :visited_rooms
    end
  end