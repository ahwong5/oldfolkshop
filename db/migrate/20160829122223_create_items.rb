class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description
      t.integer :inventory
      t.integer :status

      t.timestamps
    end
  end
end
