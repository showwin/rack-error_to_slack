require 'rack/error_to_slack/version'
require 'rack/error_to_slack/configuration'
require 'rack/error_to_slack/message'

module Rack
  # ErrorToSlack Class
  class ErrorToSlack
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => exception
        Message.new(env, exception.message, $@.first).send
        raise exception
      end
      response
    end

    class << self
      def configure
        yield(configuration)
      end

      def configuration
        @configuration ||= Configuration.new
      end
    end
  end
end
