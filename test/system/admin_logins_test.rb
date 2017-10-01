require "application_system_test_case"

class AdminLoginsTest < ApplicationSystemTestCase
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
    assert_redirected_to "/login"
    follow_redirect!
    assert_text "you have not login"
  end


  private
  def loginBy(name,password)
    visit login_url
    fill_in 'name', with: name
    fill_in 'password', with: password
    click_on 'login'
  end
end
