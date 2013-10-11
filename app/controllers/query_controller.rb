class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    @cancel_uri = query_edit_url(params[:query_uuid], "Cancel") 
    render_odm
  end

  def create_edit_error
    @cancel_uri = query_edit_error_url(params[:rws_code], "Cancel")
    render_odm
  end

  def edit
    render_nothing
  end

  private

  def render_odm
    @file_guid = SecureRandom.uuid
    render action: :create, content_type: # "application/vnd.odm+xml"
      "application/xml"
  end

  def render_nothing
    render :nothing => true, :status => :no_content
  end
end
