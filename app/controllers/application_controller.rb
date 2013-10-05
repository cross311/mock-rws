class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	render text: "Hello World"
  end

  def no_content_response
  	render :nothing => true, :status => :no_content
  end
end
