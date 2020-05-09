class CreatePracticeDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :practice_deals do |t|
      t.references :practice, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
