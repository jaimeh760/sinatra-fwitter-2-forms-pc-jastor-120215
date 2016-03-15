require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @tweets = Tweet.all
    erb :index 
  end

  get '/tweet' do
    erb :tweet
  end
  
  post '/tweet' do
    # put params (puts into terminal, not on the preview)
    # 'Hello from the Tweet Post Request!' 
    # username = params[:username]
    # status = params[:status]
    # Tweet.new(username, status)
    Tweet.new(params[:username], params[:status])
    redirect '/'
  end

end
