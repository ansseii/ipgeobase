# Ipgeobase

A simple gem, that makes a request to https://ip-api.com/ and returns an object with meta info about provided IP address:
`:city, :country, :country_code, :lat, :lon>`
## Installation

Add this line to your application's Gemfile:

    gem 'ipgeobase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'ipgeobase'

## Usage

    ip_meta = Ipgeobase.lookup('24.48.0.1')
    ip_meta.city # => Montreal
    ip_meta.country # => Canada

