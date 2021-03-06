json.id taxon.id
json.text taxon.name
json.state do
  json.opened true
end
json.data do
  json.destroy_url admin_taxonomy_taxon_url(taxonomy, taxon)
  json.update_position_url update_position_admin_taxonomy_taxon_url(taxonomy, taxon)
end
json.children taxon.children do |child|
  json.partial! partial: 'cdx/admin/taxonomies/taxons/tree', locals: { taxon: child, taxonomy: taxonomy }
end
