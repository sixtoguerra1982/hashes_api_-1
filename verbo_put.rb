require "uri"
require "net/http"

url = URI("https://jsonplaceholder.typicode.com/posts/20")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Put.new(url)
request["Content-Type"] = "application/json"
request.body = "{\n\t\"titulo\": \"Cambio de post\",\n\t\"body\": \"Actualizando el post\",\n\t\"userId\": 1\n}"

response = https.request(request)
puts response.read_body