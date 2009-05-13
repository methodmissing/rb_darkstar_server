require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class DeployRunnerTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Test::App::HelloWorld.new
    @application.packager.package!
    @runner = Darkstar::Server::Deploy::Runner.new( @application.packager )
  end
  
  test "should be able to run an application" do
    assert_equal '', @runner.run!    
  end
  
end  