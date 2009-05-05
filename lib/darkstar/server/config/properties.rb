module Darkstar
  module Server
    module Config
      class Properties < Base

        def to_s
          %[ com.sun.sgs.app.name=#{@application.name}
             com.sun.sgs.app.root=#{root}
             com.sun.sgs.impl.transport.tcp.listen.port=1139
             com.sun.sgs.app.listener=com.sun.sgs.tutorial.server.lesson1.HelloWorld ]
        end
        
        private 
        
          def root
            File.join( base_dir, 'data', @application.name )
          end
        
      end
    end
  end
end