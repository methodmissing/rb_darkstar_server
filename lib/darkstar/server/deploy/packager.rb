module Darkstar
  module Server
    module Deploy
      class Packager
        extend Forwardable
                 
        unless const_defined?(:TEMPLATE)
          TEMPLATE = File.join( ROOT, 'template' )
        end
        
        attr_accessor :application,
                      :boot_with
        
        def_delegators :application,
                       :application_name,
                       :application_path,
                       :application_tmp_path        
        
        def initialize( application )
          @application = application
        end 
        
        def path
          application_tmp_path
        end
        
        def lib
          @lib ||= File.join( path, 'lib' )
        end
        
        def config
          @config ||= File.join( path, 'conf' )
        end
        
        def listener
          @listener ||= File.join( lib, "#{application_name}.rb" )
        end
        
        def sandbox
          begin
            unlink_path!
            ensure_path!
            copy_template!
            merge!
            yield
          ensure
            #unlink_path!  
          end 
        end
        
        def configure!         
          @boot_with = @application.configuration.configure!( config )
        end
        
        def compile!
          %x[jrubyc -d #{path} #{lib}]
        end
        
        def jar!
          %x[jar -cvf #{jar} -C #{path} .]
        end
        
        def jar
          @jar ||= "/tmp/#{application_name}.jar"
        end
        
        def package!
          sandbox do
            configure!
            compile!
            jar!
          end
        end
        
        private          
        
          def unlink_path!
            FileUtils.rm_rf path
          end
          
          def ensure_path!
            FileUtils.mkdir path
          end
          
          def copy_template!
            FileUtils.cp_r( File.join( TEMPLATE, '.' ), path ) 
          end
          
          def merge!
            FileUtils.cp_r( File.join( application_path, '.' ), path, :remove_destination => true )
          end
        
      end
    end
  end
end