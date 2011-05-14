require 'rack/ssl'
require 'user_agent'

module Rack
  class SNI
    Browser = Struct.new(:browser, :version)

    SupportedBrowsers = {
      "Windows XP" => [
        Browser.new("Chrome", "6.0.0.0")
      ],
      "Windows Vista" => [
        Browser.new("Internet Explorer", "7.0"),
        Browser.new("Chrome", "1.0")
      ]
    }

    def initialize(app, options = {})
      @app     = app
      @ssl_app = Rack::SSL.new(app, options)
    end

    def call(env)
      agent = UserAgent.parse(env['HTTP_USER_AGENT'])

      if agent.any? && sni_supported?(agent)
        @ssl_app.call(env)
      else
        @app.call(env)
      end
    end

    private

    def sni_supported?(agent)
      if browsers = SupportedBrowsers[agent.os]
        browsers.detect { |browser| agent >= browser }
      else
        false # User agent isn't on our list of exceptions - assume they don't support it.
      end
    end
  end
end
