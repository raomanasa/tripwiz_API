class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        #protect_from_forgery unless: -> { request.format.json? }
end   