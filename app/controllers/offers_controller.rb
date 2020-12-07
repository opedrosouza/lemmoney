class OffersController < ApplicationController
  def index
    UpdateOffersJob.perform_now
    offers = Offer.enableds
    @offers = offers.where.not(premium: true)
    @premium = offers.premium
  end
end
