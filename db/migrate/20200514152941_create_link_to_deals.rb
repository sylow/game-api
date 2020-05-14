class CreateLinkToDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :link_to_deals do |t|
      t.references :owner, null: false, polymorphic: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
