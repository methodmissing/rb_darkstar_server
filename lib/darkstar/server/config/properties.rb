module Darkstar
  module Server
    module Config
      class Properties < Base

        def to_s
          %[ com.sun.sgs.app.name=#{application_name}
             com.sun.sgs.app.root=#{root}
             com.sun.sgs.impl.transport.tcp.listen.port=1139
             com.sun.sgs.app.listener=#{application_name} ]
        end
   
        def filename
          "#{application_name}.properties"
        end   
        
        private 
        
          def root
            File.join( base_dir, 'data', application_name )
          end
        
      end
    end
  end
end