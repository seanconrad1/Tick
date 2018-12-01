#
# authority:         "prod-api.hingeaws.net",
# content-type:       "application/json",
# x-device-platform:  iOS,
# accept:             */*,
# authorization:      "Bearer EWPYEWhESF114zhq5cMI5YDKDVH9mJlH5Lx0dr989LU=",
# x-install-id:       3BDF831B-4103-42BB-8B2E-F12AA84AEA12
# accept-language:    en-us
# accept-encoding:    br, gzip, deflate
# user-agent:         Hinge/10960 CFNetwork/974.2.1 Darwin/18.0.0
# x-build-number:     10960
# x-app-version:      6.2.6
# x-os-version:       12.0.1
# x-device-model:     iPhone 7

require 'net/http'
require 'uri'
require 'json'
require 'pry'
require './env'


def get_recommendations()
  uri = URI.parse("https://prod-api.hingeaws.net/user/public?ids=1874086013547054767")
  request = Net::HTTP::Post.new(uri)
  request.content_type = "application/json"
  # request["authority"] = "prod-api.hingeaws.net"
  # request["x-device-platform"] = "iOS"
  request["authorization"] = "Bearer EWPYEWhESF114zhq5cMI5YDKDVH9mJlH5Lx0dr989LU="
  # request["x-install-id"] = "3BDF831B-4103-42BB-8B2E-F12AA84AEA12"
  # request["accept-language"] = "en-us"
  # request["user-agent"] = "Hinge/10960 CFNetwork/974.2.1 Darwin/18.0.0"
  # request["x-build-number"] = "10960"
  # request["x-app-version"] = "6.2.6"
  # request["x-os-version"] = "12.0.1"
  # request["x-device-model"] = "iPhone 7"


  request.body = JSON.dump({
    "limit" => 5
  })

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  # response = JSON.parse(response.body)
  p response.body
end

get_recommendations()
