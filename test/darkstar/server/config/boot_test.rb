require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class ConfigBootTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => 'test' )
    @config = Darkstar::Server::Config::Boot.new( @application )
  end  
  
  test "should have a string representation" do
    assert_equal " SGS_DEPLOY=test\n             SGS_PROPERTIES=test/conf/Test.properties\n             SGS_LOGGING=test/conf/logging.properties ", @config.to_s
  end
  
end