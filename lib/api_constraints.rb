class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.header["Accept"].include?("application/vnd.marketplace.v#{@version}")
  end
end