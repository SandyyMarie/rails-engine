class ItemSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :unit_price #havent tried multiple attributes not sure if needed to individually list
  
end
