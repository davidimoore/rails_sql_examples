class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip
end
