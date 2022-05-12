require 'uri'
require 'net/http'
 
url = URI("https://jsonplaceholder.typicode.com/posts/20")
 
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
 
request = Net::HTTP::Delete.new(url)
request["content-type"] = 'application/json'
request["accept-charset"] = 'UTF-8'
request["cache-control"] = 'no-cache'
request["postman-token"] = '9a1b192d-aeb7-4509-688f-2fe0fbf5b4b0'
request.body = "{\n\t\"title\": \"Cambio de post\",\n\t\"body\":
\"Actualizando el post\",\n\t\"userId\": 1\n}\n"
 
response = http.request(request)
puts response.read_body