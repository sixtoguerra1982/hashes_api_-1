require "uri"
require "net/http"
require "json"

url = URI("https://api.coindesk.com/v1/bpi/historical/close.json")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Content-Type"] = "application/json"

response = https.request(request)


# Se pide obtener los precios y fechas del último periodo y a partir de estos obtener un arreglo
# de todas las fechas donde el valor ha sido menor a 35000 USD.
results = JSON.parse(response.read_body) # se puede un array [] o un hash {}

# Se pide obtener los precios y fechas del último periodo
new_array = Array.new #[]
ultimo_periodo = results["bpi"]

ultimo_periodo.each do |key,value|
    new_array.push key if value < 35000
end
print "#{new_array}"



# puts results
# puts results.class
# puts response.read_body

# print "#{response.class}\n"
# print "#{results} \n"
