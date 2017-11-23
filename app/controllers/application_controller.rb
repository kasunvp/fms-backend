class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActionController::ParameterMissing,
              ActiveRecord::RecordNotDestroyed do
    head :unprocessable_entity
  end
end
