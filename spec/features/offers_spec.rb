require 'rails_helper'

RSpec.feature "Offers", type: :feature do
  setup do
    @user = User.create(email: 'usertest@mail.com', password: '123123', password_confirmation: '123123')
    @offer = Offer.create(advertiser_name: 'Nike', url: 'https://nike.com', description: '50% off', starts_at: Time.zone.now, user: @user)
    visit '/login'
    fill_in 'user_email', with: 'usertest@mail.com'
    fill_in 'user_password', with: '123123'
    click_button 'Log in'
  end

  scenario 'Create new offer' do
    visit '/users/offers/new'    
    fill_in 'offer_advertiser_name', with: 'Socialliza'
    fill_in 'offer_url', with: 'https://app.socialliza.com'
    fill_in 'offer_description', with: '50% off at premium plans'
    fill_in 'offer_starts_at', with: Time.zone.now
    fill_in 'offer_ends_at', with: (Time.zone.now + 1.day)
    expect { click_button 'Save' }.to change { Offer.count }.from(1).to(2)
  end

  scenario 'Destroy a offer' do
    visit '/users/offers'
    find("a[href='/users/offers/#{@offer.id}']").click
    expect(page).to have_text('Offer deleted successfully')
  end

  scenario 'Update a offer' do
    visit "/users/offers/#{@offer.id}/edit"
    fill_in 'offer_description', with: '50% off at premium plans edit'
    click_button 'Save'
    expect(page).to have_text('Offer updated successfully')
  end
end
