require "uri"
require "net/http"
require "json"

url = URI("https://api.tutiempo.net/json/?lan=es&apid=XsD4zXz4q4qBoX4&ll=-33.457743,-70.657358")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

results = JSON.parse(response.read_body)

# locality  name
print "#{results["locality"]} \n"



