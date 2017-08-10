class AddUsersSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :cdx_users, :first_name, :string, length: 45
    add_column :cdx_users, :last_name, :string, length: 45
    add_column :cdx_users, :settings, :hstore
  end
end
