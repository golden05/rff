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

  test "user logout the system" do
    loginBy('admin','password')
    click_link 'logout'
    assert_text "Thanks byebye"
  end

end
