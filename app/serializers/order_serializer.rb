class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :products

  def products
    object.products.map do |product| 
      OrderProductSerializer.new(product).attributes
    end
  end
end
