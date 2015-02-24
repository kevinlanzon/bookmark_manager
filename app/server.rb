require 'sinatra/base'
require 'data_mapper'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

end


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!