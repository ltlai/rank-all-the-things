class CreateItemsAndLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.integer :rank, default: 0
      t.belongs_to :list
      t.timestamps
    end
  end
end
