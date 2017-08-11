class CreateCdxTaxonomies < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_taxonomies do |t|
      t.string :name, limit: 45, null: false
      t.text :description
    end
  end
end
