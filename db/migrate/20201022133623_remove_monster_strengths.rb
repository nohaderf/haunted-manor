class RemoveMonsterStrengths < ActiveRecord::Migration[6.0]
    def change
      remove_column :monsters, :strength, :integer
    end
  end