require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class ConfigurationTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => '/tmp/rb_darkstar_server_test' )
    @configuration = Darkstar::Server::Config::Configuration.new( @application )
  end  

  test "should be able to yield it's boot configuration" do
    assert_instance_of Darkstar::Server::Config::Boot, @configuration.boot
  end

  test "should be able to yield it's properties configuration" do
    assert_instance_of Darkstar::Server::Config::Properties, @configuration.properties
  end

  test "should be able to yield it's login configuration" do
    assert_instance_of Darkstar::Server::Config::Logging, @configuration.logging
  end
  
  test "should be able to configure itself" do
    @configuration.properties.expects(:write).once
    @configuration.logging.expects(:write).once
    Darkstar::Server::Config::Boot.any_instance.stubs(:write).returns('path')
    assert_equal 'path', @configuration.configure!
  end
  
end