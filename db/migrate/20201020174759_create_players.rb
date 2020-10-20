class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.integer :strength
      t.integer :health
    end
  end
end