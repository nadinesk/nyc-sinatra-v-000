class ApplicationController < Sinatra::Base

register Sinatra::ActiveRecordExtension
  enable :sessions

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
