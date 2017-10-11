class AddTemplateToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :cdx_pages, :template, :string, length: 45, default: 'default'
  end
end
