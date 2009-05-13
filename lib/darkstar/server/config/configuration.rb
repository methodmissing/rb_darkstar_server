module Darkstar
  module Server
    module Config
      class Configuration < Base
        
        def boot
          @boot ||= Config::Boot.new( self )
        end

        def properties
          @properties ||= Config::Properties.new( self )
        end

        def logging
          @logging ||= Config::Logging.new( self )
        end        
        
        def configure!( path = nil )
          [ boot, properties, logging ].map do |config|
            config.write( path )
          end.compact.detect{|c| c.match(/boot/) }  
        end        
        
      end
    end
  end
end