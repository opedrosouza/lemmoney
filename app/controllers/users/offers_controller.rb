class Users::OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offer, except: %i[index new create]
  
  def index
    @offers = current_user&.offers
  end

  def show; end

  def new
    @offer = current_user&.offers.new
  end

  def create
    @offer = current_user&.offers.new offer_params
    @offer.status = 0
    if @offer.save
      redirect_to users_offers_path, notice: 'Offer created successfully'
    else
      flash[:error] = @offer.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @offer.update offer_params
      redirect_to request.referrer, notice: 'Offer updated successfully'
    else
      flash[:error] = @offer.errors.full_messages
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to users_offers_path, notice: 'Offer deleted successfully'
  end

  def enable
    @offer.enabled!
    redirect_to request.referrer, notice: 'Offer enabled successfully'
  end

  def disable
    @offer.disabled!
    redirect_to request.referrer, notice: 'Offer disabled successfully'
  end

  private
  
  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
  end

  def set_offer
    @offer = current_user&.offers.find(params[:id])
  end
end
