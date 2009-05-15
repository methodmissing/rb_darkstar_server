require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class ConfigPropertiesTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => '/tmp/rb_darkstar_server_test' )
    @config = Darkstar::Server::Config::Properties.new( @application )
  end  
  
  test "should have a string representation" do
    assert_equal " com.sun.sgs.app.name=Test\n             com.sun.sgs.app.root=/tmp/Test/data/Test\n             com.sun.sgs.impl.transport.tcp.listen.port=1139\n             com.sun.sgs.app.listener=Test ", @config.to_s
  end
  
end