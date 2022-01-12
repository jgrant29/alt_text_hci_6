class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :super_user, :boolean
    add_column :users, :moderator, :boolean
  end
end
