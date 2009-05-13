require "#{File.dirname(__FILE__)}/../../../lib/darkstar/server"

module Darkstar
  module Server
    module Test
      module App
        class HelloWorld < Darkstar::Server::Application
          
          PROPERTIES = { :name => 'HelloWorld',
                         :path => File.expand_path( File.dirname( __FILE__ ).gsub('/lib', '') ) }
   
          def initialize( properties = nil )
            super( properties )
            hello
          end
   
          def hello
            'Hai!'
          end
          
        end
      end
    end
  end  
end