class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :price, :transmission, :drive, :mileage, :category
end
