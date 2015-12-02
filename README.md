# Rack::ErrorToSlack
This is a rack middleware that post error to slack.  
EXAMPLE: ![](https://github.com/showwin/rack-error_to_slack/blob/master/doc/sample.png)


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
`config/environments/development.rb`
```
config.middleware.use Rack::ErrorToSlack
```

#### Step2
`config/initializers/error_to_slack.rb`
```
Rack::ErrorToSlack.configure do |config|
  config.webhook_url = 'https://hooks.slack.com/services/your_webhook_url'
  ### follows are option ###
  # emoji icon of slack post
  config.emoji = ':ghost:'  # default: ':innocent:'
  # username of slack post
  config.slackname = 'ErrorSharing'  # default: 'ErrorToSlack'
end
```

## LICENSE
[MIT](https://github.com/showwin/rack-error_to_slack/blob/master/LICENSE)
