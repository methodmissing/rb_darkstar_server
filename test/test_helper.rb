require "#{File.dirname(__FILE__)}/../lib/darkstar/server"
require 'test/unit'
require 'rubygems'
require 'mocha'

module Darkstar
  module Server
    module Test
      
      unless const_defined?(:APP)
        APP = File.expand_path( File.join( File.dirname(__FILE__), 'app' ) )
        APP_LISTENER = File.join( APP, 'lib', 'hello_world' )
      end
      
      def self.setup!
        ::Test::Unit::TestCase.send(:extend, Declarative)
      end
      
      def self.app!
        require APP_LISTENER
      end
      
      # thx ActiveSupport
      module Declarative
        
        def test(name, &block)
          test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
          defined = instance_method(test_name) rescue false
          raise "#{test_name} is already defined in #{self}" if defined
          if block_given?
            define_method(test_name, &block)
          else
            define_method(test_name) do
              flunk "No implementation provided for #{name}"
            end
          end
        end
        
      end
      
    end
  end
end

Darkstar::Server::Test.setup!