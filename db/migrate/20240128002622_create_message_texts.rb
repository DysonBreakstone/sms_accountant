class CreateMessageTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :message_texts do |t|
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
