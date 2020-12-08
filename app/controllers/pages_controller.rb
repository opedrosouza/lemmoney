class PagesController < ApplicationController
  def home
    @premium = Offer.enableds.premium
  end

  def search
    @offers = Offer.enableds.search(search_params)
  end

  private

  def search_params
    params.permit(:with_name)
  end
end
