class DocumentationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application.html.erb"

  def index
    @errors = RWS_Error.get_all
  end
end