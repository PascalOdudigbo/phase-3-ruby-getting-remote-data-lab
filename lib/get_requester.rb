# Write your code here
require 'open-uri'
require 'net/http'
require 'json'

class GetRequester
    attr_accessor :url, :uri

    def initialize(url)
        @url = url
    end
    
    def get_response_body
        @uri = URI.parse(@url)
        response = Net::HTTP.get_response(@uri)
        response.body
    end

    def parse_json
        parsed_data = JSON.parse(self.get_response_body)
        arr = []
        parsed_data.collect do |data|
            arr<<data
        end
        arr

    end
end

