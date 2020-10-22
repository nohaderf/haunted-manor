class RemovePlayerStrengths < ActiveRecord::Migration[6.0]
    def change
      remove_column :players, :strength, :integer
    end
  end