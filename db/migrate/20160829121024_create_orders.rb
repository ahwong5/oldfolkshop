class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :totalprice
      t.datetime :paiddatetime
      t.integer :status

      t.timestamps
    end
  end
end
