require 'rubygems'

# Wirble provides history, auto-completion, and colorization
require 'wirble'
Wirble.init
Wirble.colorize

# Pretty print
require 'pp'


class Object
	# Echo self. Handy when used with Symbol#to_proc:
	# 	(1..10).each(&:echo)
	def echo
		puts self
	end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
	require 'logger'
	RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
