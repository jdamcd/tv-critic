require 'sinatra'
require 'supermarket'

set :port, ENV['PORT']
set :bind, '0.0.0.0'

before do
	@session = Supermarket::Session.new
end

get '/tv/:app_id' do |app_id|
	@results = @session.comments(app_id, 0, 8).comments_list.to_a
	erb :comments
end
