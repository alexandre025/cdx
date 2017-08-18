json.id taxon.id
json.text taxon.name
json.children taxon.children do |child|
  json.partial! partial: 'cdx/admin/taxons/tree', locals: { taxon: child }
end