require 'net/http'
require 'json'

class GolfCourseAPIService
  BASE_URL = "https://api.golfcourseapi.com/v1"

  def self.search_courses(query)
    url = URI("#{BASE_URL}/search?search_query=#{URI.encode_www_form_component(query)}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Key QND6S6ZMYW7FLQK2WTF3OQVZ4A"

    response = http.request(request)
    puts response.body # Add this to inspect the raw API response

    raise "API Error: #{response.message}" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end
end
