module Rack
  class ErrorToSlack
    # Configuration Class
    class Configuration
      attr_accessor :webhook_url
      attr_accessor :emoji
      attr_accessor :slackname
      attr_reader :branch
      attr_reader :username

      def initialize
        @webhook_url = nil
        @emoji = ':innocent:'
        @slackname = 'ErrorToSlack'
        @branch = `git rev-parse --abbrev-ref HEAD`.chomp || 'SOME BRANCH'
        @username = `whoami`.chomp || 'Anonymous'
      end
    end
  end
end
