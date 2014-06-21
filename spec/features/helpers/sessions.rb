module SessionHelpers

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