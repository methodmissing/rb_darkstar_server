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
   
        def prefix
          "META-INF"
        end
   
        def filename
          "app.properties"
        end   
        
        private 
        
          def root
            File.join( application_tmp_path, 'data', application_name )
          end
        
      end
    end
  end
end