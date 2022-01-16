include RestHelper

module UserimportHelper
    def import(currentPage)
        response = fetchUsers(currentPage)
        jsonResponse = JSON.parse(response)
        if !jsonResponse['data'].empty?
            jsonResponse['data'].each do |userfromJson|
                User.create({ email: userfromJson['email'], first_name: userfromJson['first_name'], last_name: userfromJson['last_name'], avatar: userfromJson['avatar'] })
            end
        else
            puts "No elements found"
        end
    end
end