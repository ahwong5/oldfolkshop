class AddUserIdToCarriers < ActiveRecord::Migration[5.0]
  def change
    add_column :carriers, :user_id, :integer
  end
end
