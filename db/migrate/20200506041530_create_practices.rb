class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :kind
      t.jsonb :data, default: {}
      t.references :user, null: false, foreign_key: true
      t.uuid :uuid
      t.timestamps
    end
  end
end
