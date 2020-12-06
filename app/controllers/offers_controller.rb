class OffersController < ApplicationController
  def index
    @offers = Offer.enableds
  end
end
