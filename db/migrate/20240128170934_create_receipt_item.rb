class CreateReceiptItem < ActiveRecord::Migration[7.0]
  def change
    create_table :receipt_items do |t|
      t.bigint :item_id
      t.bigint :receipt_id
      t.float :price

      t.timestamps
    end
  end
end
