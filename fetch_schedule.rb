require 'nokogiri'
require 'rest-client'

URL  = 'https://vmititelu.wordpress.com'
PATH = '~/Desktop' # you can set your own path

post_url = Nokogiri::HTML(RestClient.get(URL).body)
                   .at('p a:contains("anul universitar 2019")').attributes['href'].value
schedule_url = Nokogiri::HTML(RestClient.get(post_url).body)
                       .at('p a:contains("Anul 4 TI")').attributes['href'].value
file_name = schedule_url.split('/').last

system("wget #{schedule_url} -O #{PATH}/#{file_name}")
