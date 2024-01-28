class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :alias
      t.float :price
      t.bigint :vendor_id

      t.timestamps
    end
  end
end
