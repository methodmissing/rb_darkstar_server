require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class ConfigBaseTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => '/tmp/rb_darkstar_server_test' )
    @config = Darkstar::Server::Config::Base.new( @application )
  end  
  
  test "should require a string representation" do
    assert_raises Darkstar::Server::NotImplemented do
      @config.to_s
    end  
  end
  
  test "should require a filename" do
    assert_raises Darkstar::Server::NotImplemented do
      @config.filename
    end  
  end  
  
  test "should be able to write to disk" do
    @config.stubs(:filename).returns('app.boot')
    @config.stubs(:to_s).returns('config')
    assert_equal "/tmp/rb_darkstar_server_test/config/app.boot", @config.write
  end
  
end