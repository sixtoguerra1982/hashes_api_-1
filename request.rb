require "uri"
require "net/http"
require "byebug"
require "json"

def request(url_request)
    url = URI(url_request)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    results = JSON.parse(response.read_body)
end

print "#{request('https://jsonplaceholder.typicode.com/posts')}\n"