module Darkstar
  module Server
    module Config
      class Logging < Base

        def to_s
          %[ handlers=java.util.logging.FileHandler, java.util.logging.ConsoleHandler
             .level=INFO
             java.util.logging.ConsoleHandler.level=ALL
             java.util.logging.ConsoleHandler.formatter=java.util.logging.SimpleFormatter
             java.util.logging.FileHandler.level=ALL
             java.util.logging.FileHandler.pattern=%h/java%u.log
             java.util.logging.FileHandler.limit=50000
             java.util.logging.FileHandler.formatter=java.util.logging.SimpleFormatter ]
        end
        
        def filename
          "logging.properties"
        end
        
        
      end
    end
  end
end