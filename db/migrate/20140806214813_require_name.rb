class RequireName < ActiveRecord::Migration
  def up
    change_column :lists, :name, :string, null: false
    change_column :items, :name, :string, null: false
  end

  def down
    change_column :lists, :name, :string, null: true
    change_column :items, :name, :string, null: true
  end
end
