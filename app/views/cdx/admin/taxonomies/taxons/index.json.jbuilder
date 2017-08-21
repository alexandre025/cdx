json.tree @collection do |taxon|
  json.partial! partial: 'cdx/admin/taxonomies/taxons/tree', locals: { taxon: taxon, taxonomy: @taxonomy }
end
json.update_position_url update_position_admin_taxonomy_taxons_url(@taxonomy)
json.create_url admin_taxonomy_taxons_url(@taxonomy)