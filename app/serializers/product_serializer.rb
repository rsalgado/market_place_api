class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :user

  def user
    # This picks the UserSerializer attributes WITHOUT the associations, avoiding the repetition or circular references
    UserSerializer.new(object.user).attributes
  end
end
