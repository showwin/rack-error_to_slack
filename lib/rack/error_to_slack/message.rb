require 'net/http'
require 'uri'
require 'json'

module Rack
  class ErrorToSlack
    # Message Class
    class Message
      def initialize(env, err_msg)
        @data = {
          'text': "#{username} encountered an error while " \
                  "`#{env['REQUEST_METHOD']} #{env['PATH_INFO']}` " \
                  "on branch `#{branch}`\n" \
                  "```#{err_msg}```",
          'username': slackname,
          'icon_emoji': emoji
        }
      end

      def send
        request_url = ErrorToSlack.configuration.webhook_url
        Net::HTTP.post_form(URI.parse(request_url), 'payload' => @data.to_json)
      end

      private

      def username
        ErrorToSlack.configuration.username
      end

      def branch
        ErrorToSlack.configuration.branch
      end

      def slackname
        ErrorToSlack.configuration.slackname
      end

      def emoji
        ErrorToSlack.configuration.emoji
      end
    end
  end
end
