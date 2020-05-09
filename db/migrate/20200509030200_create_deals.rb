class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.column :dealer, :player_position
      t.column :zone, :deal_zone
      t.timestamps
    end
  end
end
