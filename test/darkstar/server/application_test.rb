require File.join( File.dirname(__FILE__), '..', '..', 'test_helper' )

class ApplicationTest < Test::Unit::TestCase
  
  def setup
    Darkstar::Server::Test.app!
    @application = Darkstar::Server::Test::App::HelloWorld.new
  end

  test "should be able to handle a logged in callback" do
    assert_raises Darkstar::Server::NotImplemented do
      @application.logged_in( mock('session') )
    end
  end
  
  test "should delegate missing methods to the properties" do
    assert_equal 'HelloWorld', @application.name
  end

  test "should be able to yield it's configuration" do
    assert_instance_of Darkstar::Server::Config::Configuration, @application.configuration
  end
  
  test "should be able to yield it's packager" do
    assert_instance_of Darkstar::Server::Deploy::Packager, @application.packager 
  end
  
  test "should be able to yield it's name" do
    assert_equal 'HelloWorld', @application.name  
  end

  test "should be able to yield it's path" do
    assert_equal "/Users/lourens/projects/rb_darkstar_server/test/app", @application.path  
  end  

  test "should be able to deploy itself" do
    Darkstar::Server::Deploy::Packager.any_instance.expects(:jar!).once
    @application.deploy!
  end

end