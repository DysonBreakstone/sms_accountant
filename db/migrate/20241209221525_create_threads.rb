class CreateThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :threads do |t|
      t.string :uuid

      t.timestamps
    end
  end
end
