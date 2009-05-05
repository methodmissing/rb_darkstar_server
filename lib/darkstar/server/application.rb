module Darkstar
  module Server
    class Application

      serialVersionUID = 1

      include AppListener,
              Serializable

      def initialize( properties )
        @properties = properties  
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
      
      def boot
        @boot_config ||= Config::Boot.new( self )
      end
      
      def properties
        @properties_config ||= Config::Properties.new( self )
      end
      
      private
      
        def hash_properties?
          @properties.is_a?( Hash )
        end
      
    end
  end
end  