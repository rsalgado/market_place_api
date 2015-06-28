class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements
  # Validations
  validates :total, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
