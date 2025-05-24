class Basket
  def initialize(product_catalogue:, delivery_rule:, offers: [])
    @catalogue = product_catalogue
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(code)
    raise "Invalid product code: #{code}" unless @catalogue.key?(code)
    @items << @catalogue[code].dup
  end

  def total
    applied_items = @offers.reduce(@items.dup) { |acc, offer| offer.apply(acc) }
    subtotal = applied_items.sum(&:price).round(2)
    delivery = @delivery_rule.charge(subtotal)
    (subtotal + delivery).round(2)
  end
end