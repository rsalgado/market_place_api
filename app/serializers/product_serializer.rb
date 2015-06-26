class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :user
  belongs_to :user
end
