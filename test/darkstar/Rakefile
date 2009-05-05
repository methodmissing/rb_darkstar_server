require 'rake'
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test Darkstar Server'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/darkstar/**/*_test.rb'
  t.verbose = true
end
