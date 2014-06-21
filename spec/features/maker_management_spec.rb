require 'spec_helper'

feature 'Maker signs up' do

  scenario 'whilst logged out' do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect(page).to have_content "Welcome Julia"
    expect(User.first.email).to eq "test@test.com"
    expect(User.first.username).to eq "test_handle"
  end

  def sign_up(email="test@test.com",
              name="Julia",
              username="test_handle",
              password="testtest",
              password_confirmation="testtest")
    visit '/makers/new'
    fill_in :email, :with => email
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Register'
  end

end