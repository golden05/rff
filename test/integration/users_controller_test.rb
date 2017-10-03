require 'test_helper'

class UsersControllerTest < Rff::IntegrationTest
 
  test "admin can show all users" do
    log_user('admin','password')
    get users_index_url
    assert_response :success
  end

  test "admin not login can now show all user page" do
    get users_index_url
    assert_response :redirect
  end

  test "admin can show admin attribute" do
    log_user('admin','password')
    get users_index_url
    get "/users/1"
    assert_response :success 
  end

  test "admin can edit a user" do
    @user = User.first 
    log_user('admin', 'password')
    get users_index_url
    assert_select 'a', text: 'edit'
    get edit_user_url(@user)
    assert_response :success
    assert_select 'form'
    patch user_url(@user), params: 
        { user: 
          { name: @user.name ,
            password: @user.password }
        }
    assert_redirected_to user_url(@user)

  end  

end
