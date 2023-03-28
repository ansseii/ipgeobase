# frozen_string_literal: true

require_relative 'test_helper'

class TestIpgeobase < Minitest::Test
  def setup
    @uri = '24.48.0.1'
    @stub = stub_request(:get, "#{Ipgeobase::URL}/#{@uri}")
            .with(
              headers: {
                'Accept' => '*/*',
                'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent' => 'Ruby'
              }
            )
            .to_return(status: 200, body: load_fixture('response.xml'), headers: {})
  end

  def test_lookup_http_request
    Ipgeobase.lookup @uri

    assert_requested @stub
  end

  def test_lookup_returns_metadata
    ip_meta = Ipgeobase.lookup @uri

    assert_equal 'Montreal', ip_meta.city
    assert_equal 'Canada', ip_meta.country
    assert_equal(-73.5493, ip_meta.lon)
  end

  private

  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end
