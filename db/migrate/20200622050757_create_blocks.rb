class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :description
      t.references :convention, null: false      
      t.jsonb :bidding, default: []
      t.jsonb :cards, default: []
    end
  end
end
