class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements
  
  # Validations
  validates :user_id, presence: true

  # Callbacks
  before_validation :set_total!


  def set_total!
    self.total = products.map(&:price).sum
  end
end
