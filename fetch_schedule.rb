require 'nokogiri'
require 'rest-client'

url = 'https://vmititelu.wordpress.com'
path = "~/Desktop" # you can set your own path

response = RestClient.get(url).body
page = Nokogiri::HTML(response)
schedule_url = page.at('p a:contains("Anul 3 TI!")').attributes["href"].value
file_name = schedule_url.split("/").last

system("wget #{schedule_url} -O #{path}/#{file_name}")
