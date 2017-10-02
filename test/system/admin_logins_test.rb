require "application_system_test_case"

class AdminLoginsTest < ApplicationSystemTestCase

  def setup  
    logout
  end
  
  test "admin login with valid attribute" do
    loginBy('admin','password')
    assert_text "welcome admin"
  end

  test "admin can not login with invalid attribute" do
    loginBy('admin','pp')
    assert_text "user admin login failed"
  end

  test "user not login can not visit admin index" do
    visit "/admin/index"
    assert page.has_content?("you have not login")
  end

  test "opera user can not visit admin index" do
    loginBy('opera','password')
    visit "/admin/index"
    assert page.has_content?("You are not admin")
  end

  private
  def loginBy(name,password)
    visit login_url
    fill_in 'name', with: name
    fill_in 'password', with: password
    click_on 'login'
  end

  def logout
    session  = nil
  end
end
