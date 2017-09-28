json.tree @collection do |taxon|
  json.partial! partial: 'cdx/admin/taxonomies/taxons/tree', locals: { taxon: taxon, taxonomy: @taxonomy }
end
json.create_or_update_url create_or_update_admin_taxonomy_taxons_url(@taxonomy)
