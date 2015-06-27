class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :user
end
