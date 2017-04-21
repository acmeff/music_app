class UserActivationTokenUnique < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :activation_token, :string, null: false
  end
end
