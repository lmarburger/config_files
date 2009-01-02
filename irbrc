# IRB hacks politely ripped from ThoughtBot: http://giantrobots.thoughtbot.com/2008/12/23/script-console-tips

require 'rubygems'

# Wirble provides history, auto-completion, and colorization
require 'wirble'
Wirble.init
Wirble.colorize

# Pretty print
require 'pp'

# Easily print methods local to an object's class
class Object
	def local_methods
		(methods - Object.instance_methods).sort
	end
end

# Log to STDOUT if in Rails to see database calls
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
	require 'logger'
	RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# Quick exit
alias q exit