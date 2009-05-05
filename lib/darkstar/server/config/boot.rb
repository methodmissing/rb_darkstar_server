module Darkstar
  module Server
    module Config
      class Boot < Base
        
        def to_s
          %[ SGS_DEPLOY=#{base_dir}
             SGS_PROPERTIES=#{base_dir}/conf/#{application_name}.properties
             SGS_LOGGING=#{base_dir}/conf/logging.properties ]
        end
        
        def filename
          "#{application_name}.boot"
        end
        
      end
    end
  end
end