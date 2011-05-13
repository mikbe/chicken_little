rvm_path = File.expand_path(ENV['rvm_path'] || '~/.rvm')
$LOAD_PATH.unshift File.join(rvm_path, 'lib')
require 'rvm'

rvm = RVM.environment '1.9.2@global'
puts rvm.gemset_list

rvm.gemset_use! 'global'

puts "rvm: #{`rvm-prompt`}"


