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

end
