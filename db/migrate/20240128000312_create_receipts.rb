class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.bigint :user_id
      t.bigint :vendor_id
      t.float :price_before_taxes
      t.float :price_after_taxes
      t.string :category

      t.timestamps
    end
  end
end
