class AddUserIdToOmniauthUsers < ActiveRecord::Migration
  def change
  	add_column :omniauth_users, :user_id, :integer
  end
end
