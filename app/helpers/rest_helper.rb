require 'rest-client'

module RestHelper
    def fetchUsers(page)
        response = RestClient::Request.new({
            method: :get,
            url: "#{ENV['REGRES_URL_ENDPOINT']}#{page}",
            headers: { :accept => "application/json", content_type: "application/json" }
        }).execute do |response, request, result|
            return response
        end
    end
end