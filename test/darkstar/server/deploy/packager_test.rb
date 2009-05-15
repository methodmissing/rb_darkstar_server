require File.join( File.dirname(__FILE__), '..', '..', '..', 'test_helper' )

class DeployPackagerTest < Test::Unit::TestCase
  
  def setup
    @application = Darkstar::Server::Application.new( :name => 'Test', 
                                                      :path => '/tmp/rb_darkstar_server_test' )
    @packager = Darkstar::Server::Deploy::Packager.new( @application )
  end  

  test "should be able to delegate missing methods to the application" do
    assert_equal 'Test', @packager.application_name
  end
  
  test "should be able to calculate it's path" do
    assert_equal '/tmp/Test', @packager.path  
  end
  
  test "should be able to calculate it's library path" do
    assert_equal '/tmp/Test/lib', @packager.lib     
  end

  test "should be able to yield it's listener path" do
    assert_equal '/tmp/Test/lib/Test.rb', @packager.listener   
  end
  
  test "should be able to setup a sandboxed package environment" do
    @packager.sandbox do
      assert_equal 6, Dir.entries( @packager.path ).size 
    end
  end
  
  test "should be able to compile all ruby files" do
    @packager.sandbox do
      FileUtils.touch( File.join( @packager.lib, 'test.rb' ) )
      @packager.compile!
      assert !Dir.entries( @packager.lib ).grep(/class/).empty?
    end    
  end
  
  test "should be able to create a jar file" do
    assert_equal '/tmp/Test.jar', @packager.jar
    @packager.sandbox do
      @packager.jar!
    end
  end

  test "should be able to write it's configuration to disk" do
    @packager.sandbox do
      @packager.configure!
      assert_equal "/tmp/Test/conf/Test.boot", @packager.boot_with
    end
  end
  
end