class PagesController < ApplicationController
  def home
    @premium = Offer.enableds.premium
  end
end
