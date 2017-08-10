class AddUsersSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :cdx_users, :settings, :hstore
  end
end
