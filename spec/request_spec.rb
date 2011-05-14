require 'spec_helper'

# User string information garnered from
# http://en.wikipedia.org/wiki/Server_Name_Indication
# and
# http://www.useragentstring.com/pages/useragentstring.php

describe Rack::SNI do
  include Rack::Test::Methods

  def should_use_ssl_for(agent)
    header "User-Agent", agent
    get "http://example.com/"
    last_response.should be_redirection
    last_response.location.should == "https://example.com/"
  end

  def should_not_use_ssl_for(agent)
    header "User-Agent", agent
    get "http://example.com/"
    last_response.should be_ok
  end

  def app
    @app ||= Rack::SNI.new(proc { |env| [200, {}, ["Howdy"]] })
  end



  ### Agents to require SSL for. ###

  # IE7+ on Windows Vista or higher
  it { should_use_ssl_for "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)" }

  # Google Chrome 6+ on WinXP
  it { should_use_ssl_for "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.8 (KHTML, like Gecko) Chrome/6.0.397.0 Safari/533.8" }

  # Any Google Chrome on Windows Vista or higher

  # Google Chrome 5.0.342.1 or newer on OS X 10.5.7 or higher

  # Safari 2.1 or later on Mac OS X 10.5.6 or higher and Windows Vista or higher

  # Firefox 2.0+

  # Windows Mobile above 6.5 (?)

  # Opera Mobile on Android: at least version 10.1 beta

  # Windows Phone 7

  # MicroB on Maemo

  # MobileSafari in Apple iOS 4.0 or later

  # Opera 8.0 or later if TLS 1.1 protocol enabled



  ### Agents to not require SSL for. ###

  # Any Internet Explorer on WinXP
  it { should_not_use_ssl_for "Mozilla/4.0 (compatible; MSIE 6.0b; Windows NT 5.0)" }

  # Google Chrome 5 and under on WinXP
  it { should_not_use_ssl_for "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.2 Safari/533.2" }

  # Any Safari on WinXP

  # Any Safari on Mac OSX before 10.5.6

  # Firefox below 2.0

  # Chrome on OSX: Google Chrome below 5.0.342.1 OR OSX below 10.5.7

  # Konqueror, any version

  # Blackberry Browser

  # Windows Mobile 6.5 and under

  # Android default browser

  # MobileSafari in Apple iOS before 4.0

  # Opera below 8.0, or if TLS 1.1 protocol not enabled

end
