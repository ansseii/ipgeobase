# frozen_string_literal: true

require_relative 'ipgeobase/version'

require 'addressable/uri'
require 'net/http'

module Ipgeobase
  URL = 'http://ip-api.com/xml/'
  autoload :MetaData, 'ipgeobase/meta_data'

  def self.lookup(address)
    url = Addressable::URI.parse "#{URL}/#{address}"
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)

    MetaData.parse response.body
  end
end
