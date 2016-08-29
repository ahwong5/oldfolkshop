class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.string :image
      t.integer :role
      t.string :password_reset_token
      t.datetime :password_reset_at
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
