class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.bigint :user_id
      t.bigint :vendor_id
      t.float :total_price
      t.string :category

      t.timestamps
    end
  end
end
