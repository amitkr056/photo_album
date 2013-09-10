class AddEmailToOmniauthUsers < ActiveRecord::Migration
  def change
  	add_column :omniauth_users, :email, :string
  end
end
