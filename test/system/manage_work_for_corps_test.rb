require "application_system_test_case"

class ManageWorkForCorpsTest < ApplicationSystemTestCase

  setup do
    loginBy('admin','password')
    createNewCorp('corp1')
    createNewUser('user1','password')
  end

  test "user1 work for corp1" do
    user = User.where(name: 'user1').take
    corp = Corp.where(name: 'corp1').take 
    visit "/users/#{user.id}/edit"
    click_link 'corps'
    assert page.has_content?('corp list')
    click_link 'new work for'
    select('corp1', from: 'SelectCorp')
    click_on 'submit'
    assert page.has_content?('corp1 successfull create workfor')
  end


end
