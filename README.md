# Cdx

[![Build Status](https://travis-ci.org/alexandre025/cdx.svg?branch=master)](https://travis-ci.org/alexandre025/cdx)
[![Gem Version](https://badge.fury.io/rb/cdx.svg)](https://badge.fury.io/rb/cdx)
[![Dependency Status](https://gemnasium.com/badges/github.com/alexandre025/cdx.svg)](https://gemnasium.com/github.com/alexandre025/cdx)
[![Test Coverage](https://codeclimate.com/github/alexandre025/cdx/badges/coverage.svg)](https://codeclimate.com/github/alexandre025/cdx/coverage)

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
