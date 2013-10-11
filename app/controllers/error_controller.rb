class ErrorController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @log_ref = SecureRandom.uuid
  	@error = RWS_Error.get_error(params[:rws_code])
    response.headers["X-MWS-Status"] = @error.mws_status
    render status: @error.http_status, content_type: # "application/vnd.error+xml"
      "application/xml"
  end
end