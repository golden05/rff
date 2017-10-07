require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def loginBy(name,password)
    visit login_url
    fill_in 'name', with: name
    fill_in 'password', with: password
    click_on 'login'
  end

  def logout
    session = nil
  end

  def createNewUser(name,password)
    loginBy('admin','password')
    visit new_user_url
    fill_in 'Name', with: name
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password 
    click_on 'submit'
  end

  def createNewCorp(name)
    loginBy('admin','password')
    visit new_corp_url
    fill_in 'Name', with: name
    click_on 'submit'
  end
end
