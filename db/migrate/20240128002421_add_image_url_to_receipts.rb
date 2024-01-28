class AddImageUrlToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :image_url, :string
  end
end
