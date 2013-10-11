class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    @query_uuid = params[:query_uuid]
    render_odm
  end

  def edit
    render_nothing
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
end
