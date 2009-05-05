require File.join( File.dirname(__FILE__), '..', '..', 'test_helper' )

class ApplicationTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test' )
  end

  test "should be able to handle a logged in callback" do
    assert_raises Darkstar::Server::NotImplemented do
      @application.logged_in( mock('session') )
    end
  end
  
  test "should delegate missing methods to the properties" do
    assert_equal 'Test', @application.name
  end

  test "should be able to yield it's boot configuration" do
    assert_instance_of Darkstar::Server::Config::Boot, @application.boot
  end

  test "should be able to yield it's properties configuration" do
    assert_instance_of Darkstar::Server::Config::Properties, @application.properties
  end

end