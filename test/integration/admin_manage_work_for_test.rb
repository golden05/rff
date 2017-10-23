require 'test_helper'

class AdminManageWorkForTest < Rff::IntegrationTest

  setup do
    loginByAdmin 
  end

  teardown do
    logout 
  end

  test "admin can add a workfor" do
    createNewUser('test1','password')
    createNewCorp('corp1')
    user = User.where(name: 'test1').take
    get edit_user_url(user)
    get workfor_url(user)
  end

end
