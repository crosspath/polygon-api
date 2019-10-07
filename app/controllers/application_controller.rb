class ApplicationController < ActionController::API
  protected
  
  def response_error(exception = nil)
    Rails.logger.debug { exception.backtrace.join("\n") } if exception
    render json: {status: 'error', message: exception&.message}, status: :unprocessable_entity
  end
end
