class Layout::Offer::Component < ViewComponent::Base
  def initialize(offer: nil)
    @offer = offer
  end

  def offer_class
    if @offer.premium
      'danger'
    else
      'primary'
    end
  end

  def render?
    !@offer.nil?
  end
end
