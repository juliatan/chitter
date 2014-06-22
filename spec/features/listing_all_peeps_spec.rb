require 'spec_helper'

feature 'User browses the list of links' do
  
  before(:each) {

    maker = Maker.create(:email => "test@test.com",
                  :name => "Julia",
                  :username => "test_handle",
                  :password => "test",
                  :password_confirmation => "test")

    Peep.create(:text => "Hello world! My very first peep!",
                :maker_id => maker.id)
  }

  scenario "when visiting the homepage" do
    visit '/'
    expect(page).to have_content "Hello world! My very first peep!"
    expect(page).to have_content "Julia @test_handle"
  end

end