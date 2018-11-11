json.extract! item, :id, :name, :price, :item_information, :created_at, :updated_at
json.url item_url(item, format: :json)
