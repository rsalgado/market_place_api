class UserSerializer < ActiveModel::Serializer
  #embed :ids # This is deprecated. Check `config/initializers/active_model_serializer.rb`
  attributes :id, :email, :created_at, :updated_at, :auth_token
  has_many :products
end
