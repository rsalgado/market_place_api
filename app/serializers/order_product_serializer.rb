class OrderProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published
end