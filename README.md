# RainCatcher

_RainCatcher_ utilises the [raindrops](https://bogomips.org/raindrops/) statistics tool to automatically log queue data for _Rack_ web servers (e.g. [Unicorn](https://bogomips.org/unicorn/)) running _Rails_.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rain_catcher', '~> 0.2.2'
```

And rebuild your bundle:
```
bundle install
```

## Usage

_RainCatcher_ automatically adds a hook into all web requests made to your application controller which will make a new log entry _not more frequently than_ a predetermined interval.

When each request is processed, if the configured interval has elapsed then a log entry will be made.

| Variable | Default Value | Meaning |
|-|-|-|
| `RAIN_CATCHER_LOG_INTERVAL` | 30 | Minimum number of seconds between each log entry |
| `RAIN_CATCHER_LOG_LEVEL` | INFO | Log level to use for log entries |
| `RAIN_CATCHER_APPLICATION_NAME` | [inferred from Rails] | Application identifier which will be included in all log entries |

## Log Structure

Log entries are output as _JSON_. For example:

```json
{"active":5,"queued":2,"source":"rain_catcher","application":"myapp","environment":"production"}
```
