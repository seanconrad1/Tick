require 'net/http'
require 'uri'
require 'json'
require 'pry'
require './env'

def get_recommendations()
  uri = URI.parse("https://api.gotinder.com/user/recs")
  request = Net::HTTP::Post.new(uri)
  request.content_type = "application/json"
  request["X-Auth-Token"] = ENV['token']
  request.body = JSON.dump({
    "limit" => 5
  })

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  response = JSON.parse(response.body)

  like_people(response)
end

def like_people(response)
  response.values[1].map { |e|
      uri = URI.parse("https://api.gotinder.com/like/#{e['_id']}")
      request = Net::HTTP::Get.new(uri)
      request["X-Auth-Token"] = ENV['token']

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      response = JSON.parse(response.body)
      p e['name']
  }

  sleep(5)

  get_recommendations()
end

get_recommendations()