class WeekendController < ApplicationController
  get '/' do
    weekend = Weekend.new
    erb :'weekend/index', :locals => {:weekend => weekend}
  end

  get '/about' do
    erb :'weekend/about'
  end
end