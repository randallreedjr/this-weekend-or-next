class WeekendController < ApplicationController
  get '/' do
    date = Time.now
    erb :'weekend/index', :locals => {:date => date}
  end
end