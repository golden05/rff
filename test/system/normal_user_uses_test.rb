require 'application_system_test_case'

class NormalUserUsesTest < ApplicationSystemTestCase

  def setup
    logout
  end

  test "user with valid attribute" do
    loginBy('opera', 'password')
    assert_text "welcome opera"
  end

  test "opera reset password" do
    loginBy('opera', 'password')
    click_link 'edit'
    fill_in "Password", with: "pp"
    fill_in "Password confirmation", with: "pp"
    click_on "submit"
    assert page.has_content?("opera was success updated.")
  end

end
