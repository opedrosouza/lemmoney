require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'Create user account' do
    visit '/register/new'

    find('#user_email').set 'usertest@mail.com'
    find('#user_password').set '123123'
    find('#user_password_confirmation').set '123123'

    expect { click_button 'Sign up' }.to change { User.count }.from(0).to(1)
  end

  scenario 'Login my account' do
    User.create(email: 'usertest@mail.com', password: '123123', password_confirmation: '123123')
    
    visit '/login'
  
    fill_in 'user_email', with: 'usertest@mail.com'
    fill_in 'user_password', with: '123123'
  
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

end
