class DeliveryRule
  def initialize(thresholds)
    @thresholds = thresholds.sort_by(&:first)
  end

  def charge(subtotal)
    @thresholds.each do |limit, fee|
      return fee if subtotal < limit
    end
    0.0
  end
end