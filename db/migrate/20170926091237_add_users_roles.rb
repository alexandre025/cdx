class AddUsersRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :cdx_users, :roles, :string, array: true, default: []
  end
end
