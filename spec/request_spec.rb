require 'spec_helper'

# User string information garnered from
# http://en.wikipedia.org/wiki/Server_Name_Indication
# and
# http://www.useragentstring.com/pages/useragentstring.php

should_use_ssl = [
  # IE7+ on Windows Vista or higher
  "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)"

  # Any Google Chrome on Windows Vista or higher

  # Google Chrome 6+ on WinXP

  # Google Chrome 5.0.342.1 or newer on OS X 10.5.7 or higher

  # Safari 2.1 or later on Mac OS X 10.5.6 or higher and Windows Vista or higher

  # Firefox 2.0+

  # Windows Mobile above 6.5 (?)

  # Opera Mobile on Android: at least version 10.1 beta

  # Windows Phone 7

  # MicroB on Maemo

  # MobileSafari in Apple iOS 4.0 or later

  # Opera 8.0 or later if TLS 1.1 protocol enabled
]

should_not_use_ssl = [
  # Any Internet Explorer on WinXP
  "Mozilla/4.0 (compatible; MSIE 6.0b; Windows NT 5.0)"

  # Google Chrome 5 and under on WinXP

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
]

describe "A request with a user-agent of" do
  should_use_ssl.each do |agent|
    it "#{agent} should be redirected to use SSL" do
      pending
    end
  end

  should_not_use_ssl.each do |agent|
    it "#{agent} should not be redirected to use SSL" do
      pending
    end
  end
end