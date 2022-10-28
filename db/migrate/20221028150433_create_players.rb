class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :slack_id
      t.integer :health_points

      t.timestamps
    end
  end
end
