class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    @query_uuid = params[:context_uuid]
    render_odm
  end

  def cancel
    render_nothing
  end

  def forward
    render_nothing
  end

  def answer
    render_nothing
  end

  def close
    render_nothing
  end

  def requery
    render_nothing
  end

  def query_not_found
    render_error("Query marking group name not found", "RWS00071", "0200002", :not_found)
    #render_nothing
  end

  private

  def render_odm
    @file_guid = SecureRandom.uuid
    render content_type: # "application/vnd.odm+xml"
      "application/xml"
  end

  def render_nothing
    render :nothing => true, :status => :no_content
  end

  def render_error(message, rws_code, mws_status, http_status)
    @log_ref = SecureRandom.uuid
    @message = message
    @rws_code = rws_code
    response.headers["X-MWS-Status"]=mws_status
    render action: :error, status: http_status, content_type: # "application/vnd.error+xml"
      "application/xml"
  end
end
