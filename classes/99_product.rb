class Product
  attr_accessor :price, :count

  def initialize(params)
    @price = params[:price]
    @count = params[:count]
  end
end
