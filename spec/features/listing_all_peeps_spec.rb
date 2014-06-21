require 'spec_helper'

feature 'User browses the list of links' do
  
  before(:each) {
    Peep.create(:text => "Hello world! My very first peep!")
  }

  scenario "when visiting the homepage" do
    visit '/'
    expect(page).to have_content "Hello world! My very first peep!"
  end
end