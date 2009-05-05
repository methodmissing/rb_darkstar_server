require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class ConfigLoggingTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => '/tmp/rb_darkstar_server_test' )
    @config = Darkstar::Server::Config::Logging.new( @application )
  end  
  
  test "should have a string representation" do
    assert_equal " handlers=java.util.logging.FileHandler, java.util.logging.ConsoleHandler\n             .level=INFO\n             java.util.logging.ConsoleHandler.level=ALL\n             java.util.logging.ConsoleHandler.formatter=java.util.logging.SimpleFormatter\n             java.util.logging.FileHandler.level=ALL\n             java.util.logging.FileHandler.pattern=%h/java%u.log\n             java.util.logging.FileHandler.limit=50000\n             java.util.logging.FileHandler.formatter=java.util.logging.SimpleFormatter ", @config.to_s
  end
  
end