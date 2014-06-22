require 'spec_helper'

feature 'Maker submits a new peep'do
  
  before(:each) {
    Maker.create(:email => "test@test.com",
                  :name => "Julia",
                  :username => "test_handle",
                  :password => "test",
                  :password_confirmation => "test")
  }

  scenario "must be signed in to be able to post a peep" do
    expect(Peep.count).to eq 0
    visit '/peeps/new'
    expect(page).to have_content "You need to sign up for a Maker account before you can post a peep."
  end

  scenario "when logged in" do
    expect(Peep.count).to eq 0
    visit '/'
    sign_in("test_handle", "test")
    add_peep("Hello world!")
    expect(Peep.count).to eq 1
    peep = Peep.first
    expect(peep.text).to eq "Hello world!"
  end

  def add_peep(text)
    visit '/peeps/new'
    fill_in 'text', :with => text
    click_button 'Peep'
  end

end