require 'sinatra'
require 'supermarket'

before do
	@session = Supermarket::Session.new
end

get '/tv/:app_id' do |app_id|
	@results = @session.comments(app_id, 0, 8).comments_list.to_a
	erb :comments
end
