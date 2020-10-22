class AddRoomNumbers < ActiveRecord::Migration[6.0]
    def change
      add_column :rooms, :number, :integer
    end
  end