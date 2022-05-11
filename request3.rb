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

# print "#{request('https://jsonplaceholder.typicode.com/photos')[0..9]}\n"
data = request('https://jsonplaceholder.typicode.com/photos')

# photos = []
# array.each do |element|
#     photos.push element["url"]
# end

photos = data.map{|x| x['url']}#

# print photos

html = ""
photos[0..5].each do |photo|
    html += "<img src=\"#{photo}\">\n"
end
File.write('output.html',html)

# hacer el request y obtendremos un array
# hacer un arreglo con todas las fotos

#