require 'rack-sni'
require 'rack/test'

require 'ruby-debug'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

# Require shared example groups before running any specs
Dir["#{File.dirname(__FILE__)}/**/shared/*.rb"].each { |file| require file }
