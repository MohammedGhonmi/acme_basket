class Basket
  def initialize(product_catalogue:)
    @catalogue = product_catalogue
    @items = []
  end

  def add(code)
    raise "Invalid code: #{code}" unless @catalogue.key?(code)
    @items << @catalogue[code].dup
  end

  def total

  end
end