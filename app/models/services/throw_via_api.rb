require 'net/http'

module Services
  class ThrowViaAPI

    def perform
      uri = URI.parse(Throw::API_URL)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)
      response_body = JSON.parse(http.request(request)&.body)
      final_throw = response_body["body"]&.gsub!(/^\"|\"?$/, '')

      final_throw
    rescue ::Net::ReadTimeout => e
      # puts e.message
    end
  end
end