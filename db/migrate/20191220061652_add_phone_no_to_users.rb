class AddPhoneNoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_no, :string
    add_index :users, :phone_no, unique: true
  end
end
