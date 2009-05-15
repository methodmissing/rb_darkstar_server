module Darkstar
  module Server
    class Application
      class MissingName < StandardError
      end
      
      class MissingPath < StandardError  
      end    

      serialVersionUID = 1

      include AppListener,
              Serializable

      def initialize( properties = nil)
        @properties = properties || self.class.const_get(:PROPERTIES)  
      end

      def logged_in( session )
        raise NotImplemented
      end

      def method_missing( method, *args, &block )
        if hash_properties?
          @properties[method]  
        else
          @properties.send(method, *args, &block)
        end  
      end
            
      def configuration
        @configuration ||= Config::Configuration.new( self )
      end
      
      def packager
        @packager ||= Darkstar::Server::Deploy::Packager.new( self )
      end
      
      def runner
        @runner ||= Darkstar::Server::Deploy::Runner.new( self )        
      end
      
      def deploy!
        packager.package!
      end
      
      def application_name
        name || raise( MissingName )
      end
      
      def application_tmp_path
        File.join( '', 'tmp', name )
      end
      
      def application_path
        path || raise( MissingPath )
      end
      
      private
      
        def hash_properties?
          @properties.is_a?( Hash )
        end
      
    end
  end
end  