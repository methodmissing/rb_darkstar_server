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
        
        def configure!
          [ boot, properties, logging ].each do |config|
            config.write
          end  
        end        
        
      end
    end
  end
end