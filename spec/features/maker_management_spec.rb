require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

feature 'Maker signs up' do

  scenario 'whilst logged out' do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect(page).to have_content "Welcome Julia"
    expect(Maker.first.email).to eq "test@test.com"
    expect(Maker.first.username).to eq "test_handle"
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up("test@test.com", "Julia", "test_handle", "testtest", "wrongtest") }.to change(Maker, :count).by 0
    expect(current_path).to eq '/makers'
    expect(page).to have_content 'Sorry, your passwords do not match'
  end

  scenario "with an email and username that is already registered" do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect{ sign_up }.to change(Maker, :count).by 0
    expect(page).to have_content 'This email has already been registered'
    expect(page).to have_content 'This username has already been taken'
  end

end

feature 'Maker signs in' do

  before(:each) {
    Maker.create(:email => "test@test.com",
                  :name => "Julia",
                  :username => "test_handle",
                  :password => "test",
                  :password_confirmation => "test")
  }

  scenario "can sign in with correct credentials" do
    visit '/'
    expect(page).not_to have_content "Welcome Julia"
    sign_in("test_handle", "test")
    expect(page).to have_content "Welcome Julia"
  end

  scenario "cannot sign in with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content "Welcome Julia"
    sign_in("test_handle", "wrong")
    expect(page).not_to have_content "Welcome Julia"
  end
end

feature 'User signs out' do

  before(:each) {
    Maker.create(:email => "test@test.com",
                  :name => "Julia",
                  :username => "test_handle",
                  :password => "test",
                  :password_confirmation => "test")
  }

  scenario 'while being signed in' do
    sign_in("test_handle", "test")
    click_button 'Log out'
    expect(page).to have_content "Goodbye Julia"
    expect(page).not_to have_content "Welcome Julia"
  end

end