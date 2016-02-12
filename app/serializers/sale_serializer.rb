class SaleSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :customer_id, :date, :quantity, :price
end
