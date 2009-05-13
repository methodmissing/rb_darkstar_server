module Darkstar
  module Server
    module Deploy
      class Runner
        
        attr_accessor :packager
        
        def initialize( packager )
          @packager = packager
        end
        
        def run!
          run( 'boot' )
        end

        def kill!
          run( 'stop' )          
        end
        
        private
        
          def run( variation = 'boot' )
            puts cmd( variation )
            puts %x[#{cmd( variation )}]
          end
        
          def cmd( variation )
            "java -jar #{File.join( VENDOR, 'bin', "sgs-#{variation}.jar" )};/opt/local/jruby/lib/jruby.jar #{@packager.boot_with}"
          end
        
      end
    end
  end
end