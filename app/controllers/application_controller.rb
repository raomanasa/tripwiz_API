class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        #protect_from_forgery unless: -> { request.format.json? } 
  rescue_from ActionController::ParameterMissing, with: :missing_params

  def missing_params
    render json: { error: "Missing parameters" }, status: 422
  end
end
