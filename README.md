# Rack::ErrorToSlack
This is a rack middleware that post error to slack.  
Strongly recommended to use **only Development environment**.  
EXAMPLE: ![](https://github.com/showwin/rack-error_to_slack/blob/master/doc/sample.png)

Inspired by [hitode909/Plack-Middleware-PostErrorToSlack](https://github.com/hitode909/Plack-Middleware-PostErrorToSlack)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-error_to_slack'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rack-error_to_slack

## Usage
### for Rails 4.x
#### Step1
config/environments/development.rb
```
config.middleware.insert_before ActionDispatch::RemoteIp, Rack::ErrorToSlack
```

#### Step2
config/initializers/error_to_slack.rb
```
Rack::ErrorToSlack.configure do |config|
  config.webhook_url = 'https://hooks.slack.com/services/your_webhook_url'
  
  ### follows are option ###
  # emoji icon of slack post.  DEFAULT VALUE: ':innocent:'
  config.emoji = ':ghost:'  
  
  # username of slack post.    DEFAULT VALUE: 'ErrorToSlack'
  config.slackname = 'ErrorSharing'
end
```

## :warning: WARNING :warning:
This gem is recommended to use **only Development environment**.  
Your application cannot respond to users until `rack-error_to_message` succeeds to post error message to Slack.


Following settings are recommended.

Gemfile
```
gem 'rack-error_to_slack', group: :development
```

config/initializers/error_to_slack.rb
```
if Rails.env == "development"
  Rack::ErrorToSlack.configure do |config|
    config.webhook_url = 'https://hooks.slack.com/services/your_webhook_url'
  end
end
```

## LICENSE
[MIT](https://github.com/showwin/rack-error_to_slack/blob/master/LICENSE)
