class AddTaxonToPages < ActiveRecord::Migration[5.1]
  def change
    add_reference :cdx_pages, :taxon, index: true
    add_foreign_key :cdx_pages, :cdx_taxons, column: :taxon_id
  end
end
