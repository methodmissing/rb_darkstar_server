require 'java'
require 'forwardable'
require 'fileutils'

$:.unshift(File.dirname(__FILE__))

module Darkstar
  module Server
    class NotImplemented < StandardError
    end  
  
    unless const_defined?(:ROOT)
      ROOT = File.expand_path( File.join( File.dirname(__FILE__), '..', '..' ) )
    
      VENDOR = File.join( ROOT, 'vendor' )
    
      JARS = File.join( VENDOR, 'lib' )

      DEPLOY = File.join( VENDOR, 'deploy' )
    end
    
    autoload :Bridge, 'server/bridge'
    autoload :Application, 'server/application'
    
    module Config

      autoload :Base, 'server/config/base'      
      autoload :Boot, 'server/config/boot'
      autoload :Properties, 'server/config/properties'
      autoload :Logging, 'server/config/logging'
      autoload :Configuration, 'server/config/configuration'
      
    end
    
    module Deploy
      
      autoload :Packager, 'server/deploy/packager'
      autoload :Runner, 'server/deploy/runner'
      
    end
    
    extend Bridge unless const_defined?(:AppListener)
  end
end