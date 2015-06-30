class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements
  
  # Validations
  validates :user_id, presence: true
  validates_with EnoughProductsValidator

  # Callbacks
  before_validation :set_total!


  def set_total!
    self.total = placements.reduce(0) do |total, placement|
      total + placement.product.price * placement.quantity
    end
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity
      self.placements.build(product_id: id, quantity: quantity)
    end
  end
end
