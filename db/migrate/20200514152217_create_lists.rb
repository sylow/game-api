class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :parent_id
      t.references :user, null: false, foreign_key: true
      t.uuid :uuid
    end
  end
end
