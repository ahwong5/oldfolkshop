class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :address, :string
    add_column :users, :phone, :integer
    add_column :users, :role, :integer, default: 0
  end
end
