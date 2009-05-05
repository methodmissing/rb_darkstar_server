require File.join( File.dirname(__FILE__), '..', '..', 'test_helper' )

class ApplicationTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test',
                                                      :path => '/tmp/rb_darkstar_server_test' )
  end

  test "should be able to handle a logged in callback" do
    assert_raises Darkstar::Server::NotImplemented do
      @application.logged_in( mock('session') )
    end
  end
  
  test "should delegate missing methods to the properties" do
    assert_equal 'Test', @application.name
  end

  test "should be able to yield it's configuration" do
    assert_instance_of Darkstar::Server::Config::Configuration, @application.configuration
  end
  
  test "should be able to yield it's name" do
    assert_equal 'Test', @application.name  
  end

  test "should be able to yield it's path" do
    assert_equal "/tmp/rb_darkstar_server_test", @application.path  
  end  

end