module Darkstar
  module Server
    module Test
      module App
        class HelloWorld < Darkstar::Server::Application
          
          PROPERTIES = { :name => 'HelloWorld'
                         :path => File.expand_path( File.dirname( __FILE__ ) ) }
          
        end
      end
    end
  end  
end