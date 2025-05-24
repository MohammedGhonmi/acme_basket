class RedWidgetOffer < Offer
  def apply(items)
    red_items, others = items.partition { |item| item.code == 'R01' }

    discounted = red_items.each_with_index.map do |item, index|
      price = index.odd? ? (item.price / 2.0).round(2) : item.price
      Product.new(code: item.code, name: item.name, price: price)
    end

    discounted + others
  end
end
