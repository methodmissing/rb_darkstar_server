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
          @boot_with = @application.configuration.configure! #( path )
        end
        
        def compile!
          %x[jrubyc -d #{path} -t #{path} #{lib}]
        end
        
        def jar!
          %x[jar -cvf #{jar} -C #{path} .]
          FileUtils.cp File.join( lib, 'hello_world.class' ), File.join( path, 'HelloWorld.class' ) if File.exist?( File.join( path, 'HelloWorld.class' ) ) 
        end
        
        def jar
          @jar ||= "/tmp/#{application_name}.jar"
        end
        
        def deploy_jar!
          FileUtils.cp jar, DEPLOY
        end
        
        def package!
          sandbox do
            configure!
            compile!
            jar!
            deploy_jar!
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