require 'test_helper'

class CorpTest < ActiveSupport::TestCase
  
  test "create with name attribute" do
    corp = Corp.new
    corp.name = "dhsp"
    assert corp.save 
  end

  test "can not create without name" do
    corp = Corp.new
    corp.name = ""
    assert_not corp.save
  end

  test "can not save dup name" do
    c1 = Corp.new
    c1.name = "c1"
    c1.save
    c2 = Corp.new
    c2.name = "c1"
    assert_not c2.save
  end
end
