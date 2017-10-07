require "application_system_test_case"

class AdminManageUsersTest < ApplicationSystemTestCase
 
  def setup
    loginBy('admin', 'password')
    click_link "manage users"
  end

  test "visit the manager users index" do
    assert page.has_content?("Users Index")
    assert page.has_content?("admin")
  end

  test "add a user" do
    createNewUser('jam','password') 
    assert page.has_content?("jam")
  end

  test "can edit a user" do
    createNewUser('jam','password') 
    n = page.all('a').size - 2
    page.all('a')[n].click
    fill_in "Name", with: "jamith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "submit"
    assert page.has_content?("jamith")
  end
end
