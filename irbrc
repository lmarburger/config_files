require 'rubygems'
require 'activesupport'

# Wirble provides history, auto-completion, and colorization
require 'wirble'
Wirble.init
Wirble.colorize

# Pretty print
require 'pp'

# Quick exit
alias q exit

# Easily print methods local to an object's class
class Object
	def local_methods
		(methods - Object.methods).sort
	end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
	require 'logger'
	RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end