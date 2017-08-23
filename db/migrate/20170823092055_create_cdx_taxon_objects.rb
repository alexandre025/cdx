class CreateCdxTaxonObjects < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_taxon_objects do |t|
      t.references :taxon, index: true
      t.references :object, polymorphic: true, index: true
      t.timestamps
    end

    add_foreign_key :cdx_taxon_objects, :cdx_taxons, column: :taxon_id
  end
end
