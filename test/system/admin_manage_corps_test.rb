require 'application_system_test_case'

class AdminManageCorpsTest < ApplicationSystemTestCase

  def setup
    loginBy('admin','password')
    click_link "manage corps"
  end

  test "visit the corps index" do
    assert page.has_content?("Corps Index")
  end

  test "add a new corp" do
    createNewCorp('dhsp')
    assert page.has_content?("dhsp")
  end

  test "edit a corp" do
    createNewCorp("dhsp")
    find('#dhsp').click
    fill_in "Name", with: "shanghai dh sp"
    click_on "submit"
    assert page.has_content?("shanghai dh sp")
  end

end
