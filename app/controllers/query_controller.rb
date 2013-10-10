class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    render content_type: "application/xml"
  end

  def cancel
  	render :nothing => true, :status => :no_content
  end
end
