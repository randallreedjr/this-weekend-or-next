class ApplicationController < Sinatra::Base
  set :static, true
  set :views, Proc.new { File.join(root, "../views/") }
end