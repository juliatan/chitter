require 'spec_helper'

feature 'Maker submits a new peep'do
  
  scenario "when browsing the website" do
    expect(Peep.count).to eq 0
    visit '/peeps/new'
    add_peep("Hello world!")
    expect(Peep.count).to eq 1
    peep = Peep.first
    expect(peep.text).to eq "Hello world!"
  end

  def add_peep(text)
    fill_in 'text', :with => text
    click_button 'Peep'
  end

end