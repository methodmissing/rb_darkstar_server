module Darkstar
  module Server
    module Config
      class Base
        extend Forwardable
        
        attr_reader :application
        
        def_delegators :application, 
                       :application_name, 
                       :application_path,
                       :application_tmp_path
        
        def initialize( application )
          @application = application
        end
        
        def to_s
          raise NotImplemented
        end
        
        def filename
          raise NotImplemented
        end
        
        def write( path = nil  )
          ensure_directory( path ) do
            File.open( with_directory, "w+" ) do |file|
              file << to_s
            end    
          end 
          with_directory
        end
        
        private
        
          def ensure_directory( path )
            @directory = path if path
            FileUtils.makedirs directory
            yield
          end
          
          def with_directory
            File.join( directory, filename )
          end
          
          def directory
            @directory || File.join( application_path, 'conf' )
          end
        
          def base_dir
            "#{application_path}"
          end
        
      end
    end
  end
end