require 'active_support/core_ext/time'

class WeekendController < ApplicationController
  get '/' do
    weekend = Weekend.new
    current_timezone = weekend.timezone
    timezone_list = ActiveSupport::TimeZone.all.map(&:name).sort
    erb :'weekend/index', :locals => {
      weekend: weekend,
      timezone_list: timezone_list,
      current_timezone: current_timezone
    }
  end

  post '/' do
    current_timezone = params[:timezone]
    weekend = Weekend.new current_timezone
    timezone_list = ActiveSupport::TimeZone.all.map(&:name).sort
    erb :'weekend/index', :locals => {
      weekend: weekend,
      timezone_list: timezone_list,
      current_timezone: current_timezone
    }
  end

  get '/about' do
    erb :'weekend/about'
  end
end
