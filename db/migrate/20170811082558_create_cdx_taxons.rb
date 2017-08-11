class CreateCdxTaxons < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_taxons do |t|
      t.string :name, limit: 45, null: false
      t.text :description
      t.references :taxonomy, index: true, null: false
      t.references :parent, index: true
    end

    add_foreign_key :cdx_taxons, :cdx_taxonomies, column: :taxonomy_id
    add_foreign_key :cdx_taxons, :cdx_taxons, column: :parent_id
  end
end
