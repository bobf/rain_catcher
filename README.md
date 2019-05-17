# RainCatcher

_RainCatcher_ utilises the [raindrops](https://bogomips.org/raindrops/) statistics tool to automatically log _Rack_ web server queue data for _Rails_ applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rain_catcher', '~> 0.1.0'
```

And rebuild your bundle:
```
bundle install
```

## Usage

_RainCatcher_ automatically adds a hook into all web requests made to your application controller which will make a new log entry _not more frequently than_ a predetermined interval.

When each request is processed, if the configured interval has elapsed then a log entry will be made.

The default log level is `INFO`. This can be overridden by the environment variable `RAIN_CATCHER_LOG_LEVEL`

| Variable | Default Value | Meaning
|-|-|
| `RAIN_CATCHER_LOG_INTERVAL` | 30 | Minimum number of seconds between each log entry |
| `RAIN_CATCHER_LOG_LEVEL` | INFO | Log level to use for log entries |
