require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class PropertiesTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => 'test' )
    @config = Darkstar::Server::Config::Properties.new( @application )
  end  
  
  test "should have a string representation" do
    assert_equal " com.sun.sgs.app.name=Test\n             com.sun.sgs.app.root=test/data/Test\n             com.sun.sgs.impl.transport.tcp.listen.port=1139\n             com.sun.sgs.app.listener=com.sun.sgs.tutorial.server.lesson1.HelloWorld ", @config.to_s
  end
  
end