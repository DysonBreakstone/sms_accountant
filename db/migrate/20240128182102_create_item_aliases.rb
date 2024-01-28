class CreateItemAliases < ActiveRecord::Migration[7.0]
  def change
    create_table :item_aliases do |t|
      t.bigint :user_id
      t.bigint :item_id
      t.string :alias_name

      t.timestamps
    end
  end
end
