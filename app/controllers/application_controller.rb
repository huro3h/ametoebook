class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  Fluent::Logger::FluentLogger.open(nil, :host=>'localhost', :port=>24224)
  before_action :fluentpost

  def fluentpost
    Fluent::Logger.post("ate.access", {"url"=>request.fullpath, "time"=>Time.current.to_s})
  end
end
