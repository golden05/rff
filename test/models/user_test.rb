require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "create with valid attribute" do 
    user = createUser('pp','password')
    assert user.save
  end

  test "can not save without name" do
    user = createUser('','password')
    assert !user.save
  end

  test "can not save with dup name" do
    user1 = createUser('admin','password') 
    user1.save
    user = createUser('admin', 'password') 
    assert !user.save
  end

  test "can not save without password" do
    user = createUser('admin','')
    assert !user.save
  end

  private 
  def createUser(name,password)
    user = User.new
    user.name = name
    user.password = password
    return user
  end
end
