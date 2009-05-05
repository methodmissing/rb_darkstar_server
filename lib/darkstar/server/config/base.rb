module Darkstar
  module Server
    module Config
      class Base
        
        attr_reader :application
        
        def initialize( application )
          @application = application
        end
        
        def to_s
          raise NotImplemented
        end
        
        private
        
          def base_dir
            "#{application.path}"
          end
        
      end
    end
  end
end