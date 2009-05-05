module Darkstar
  module Server
    module Bridge

      def self.extended( mod )
        mod.jars!
        mod.imports!
      end
      
      def jars!
        %w( db-4.5.20.jar
            je-3.3.75.jar
            sgs-server-0.9.9.jar
            sgs-server-api-0.9.9.jar
            sgs-shared-1.4.jar ).each do |definition|
              jar!( definition )
            end      
      end
            
      def imports!
        %w( java.io.Serializable
            java.util.Properties
            java.util.logging.Level
            java.util.logging.Logger
            
            com.sun.sgs.app.AppContext
            com.sun.sgs.app.AppListener
            com.sun.sgs.app.ClientSession
            com.sun.sgs.app.ClientSessionListener
            com.sun.sgs.app.DataManager
            com.sun.sgs.app.Channel
            com.sun.sgs.app.ChannelListener
            com.sun.sgs.app.ChannelManager
            com.sun.sgs.app.ExceptionRetryStatus
            com.sun.sgs.app.ManagedObject
            com.sun.sgs.app.ManagedObjectRemoval
            com.sun.sgs.app.ManagedReference
            com.sun.sgs.app.PeriodicTaskHandle
            com.sun.sgs.app.Task
            com.sun.sgs.app.TaskManager            
          ).each do |package|
              import( package )
            end  
      end
      
      private
      
        def jar!( definition )
          jar( definition )
        end
      
        def jar( definition )
          require( File.join( JARS, definition ) )
        end

    end
  end
end