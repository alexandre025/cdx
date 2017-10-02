# Cdx

[![Build Status](https://travis-ci.com/alexandre025/cdx.svg?token=in8sSsy4MxZn4XxNavha&branch=master)](https://travis-ci.com/alexandre025/cdx)
[![Dependency Status](https://gemnasium.com/badges/github.com/alexandre025/cdx.svg)](https://gemnasium.com/github.com/alexandre025/cdx)

Cdx is a rails 5.1.x engine which provide a ready to use admin panel with some components such as static pages, resource controller, multi-site, models translations, assets uploading, user management...

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cdx', github: 'alexandre025/cdx'
```

And then execute:
```bash
$ bundle
$ bundle exec rails cdx:install:migrations
$ bundle exec g cdx:install
```

By default, cdx's admin panel is mounted on `/admin`.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
