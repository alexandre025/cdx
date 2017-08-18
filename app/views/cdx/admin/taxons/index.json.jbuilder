json.tree @collection do |taxon|
  json.partial! partial: 'cdx/admin/taxons/tree', locals: { taxon: taxon }
end