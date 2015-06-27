ActiveModel::Serializer.setup do |config|
  # This is necessary to avoid the use of `embed` in the serializers, which is now deprecated.
  config.embed = :ids
  config.embed_in_root = false
end
