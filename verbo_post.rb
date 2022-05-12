require 'uri'
require 'net/http'
 
url = URI("https://jsonplaceholder.typicode.com/posts")
 
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
 
request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["cache-control"] = 'no-cache'
request["postman-token"] = 'f230cc3e-dcda-37b6-556d-fd1e9d334108'
request.body = "{\n\t\"title\": \"Post 101\",\n\t\"body\": \"Este es nuestro primer Post\",\n\t\"userId\": 1\n}\n"
 
response = http.request(request)
puts response.read_body

# CRUD = CREATE READ UPDATE DELETE -> RECURSO POST -> ACTION POST -> API REST