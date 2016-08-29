class AddItemIdToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    add_column :ordered_items, :item_id, :integer
  end
end
