require_relative '../core/product'
require_relative '../core/offer'
require_relative '../core/red_widget_offer'
require_relative '../core/delivery_rule'
require_relative '../core/basket'

def product_catalogue
  {
    'R01' => Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
    'G01' => Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
    'B01' => Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
  }
end

def delivery_rules
  DeliveryRule.new([
    [50, 4.95],
    [90, 2.95]
  ])
end

def test_basket(codes)
  basket = Basket.new(product_catalogue: product_catalogue, delivery_rule: delivery_rules, offers: [RedWidgetOffer.new])
  codes.each { |code| basket.add(code) }
  puts "Basket: #{codes.join(', ')} => Total: $#{'%.2f' % basket.total}"
end

test_basket(%w[B01 G01])             # $37.85
test_basket(%w[R01 R01])             # $54.37
test_basket(%w[R01 G01])             # $60.85
test_basket(%w[B01 B01 R01 R01 R01]) # $98.27
