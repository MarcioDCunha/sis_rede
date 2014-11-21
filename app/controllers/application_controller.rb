class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def serv_json
    "http://api.dribbble.com/shots/popular?page=1"
  end

end

