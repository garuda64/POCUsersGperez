include RestHelper

module UserimportHelper
    def import(currentPage)
        response = fetchUsers(currentPage)
        jsonResponse = JSON.parse(response)
        if !jsonResponse['data'].empty?
            puts "<<<<<<<<<<<<<<"
            puts jsonResponse['data'].to_json
        end
    end
end