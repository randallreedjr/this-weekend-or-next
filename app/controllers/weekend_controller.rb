class WeekendController < ApplicationController
  get '/' do
    erb :'weekend/index'
  end
end