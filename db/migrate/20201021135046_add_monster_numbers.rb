class AddMonsterNumbers < ActiveRecord::Migration[6.0]
    def change
      add_column :monsters, :number, :integer
    end
  end