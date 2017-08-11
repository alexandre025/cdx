class CreateCdxSites < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_sites do |t|
      t.string :name, limit: 45, null: false
      t.string :acronym, limit: 45, null: false
      t.string :domain, limit: 45, null: false
      t.json :settings
      t.boolean :default, default: false
    end
  end
end
