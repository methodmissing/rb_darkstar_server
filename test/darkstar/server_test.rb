require File.join( File.dirname(__FILE__), '..', 'test_helper' )

class ServerTest < Test::Unit::TestCase
  
  test "should be able to locate vendored items" do
    assert_match /vendor/, Darkstar::Server::VENDOR
  end

  test "should be able to locate jars" do
    assert_match /vendor\/lib/, Darkstar::Server::JARS
  end
  
  test "should bridge the java darkstar package" do
    assert_nothing_raised do
      Darkstar::Server::AppContext
    end
  end 
  
end