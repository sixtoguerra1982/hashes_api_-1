# Obteniendo los precios de bitcoins
require 'uri'
require 'net/http'
require  'json'
def request(url_requested)
    url = URI(url_requested)
    
    http = Net::HTTP.new(url.host, url.port)
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    
    
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    return JSON.parse(response.body)
end
 
prices = request('https://api.coindesk.com/v1/bpi/historical/close.json')['bpi']

#  opcion 1
# selected_data = prices.select {|k,v| v < 35000 }

# print "#{selected_data.keys} \n"

under_35000 = prices.values.select {|x| x < 35000 }
dates = under_35000.map {|x| prices.invert[x]}
print "#{dates} \n"

