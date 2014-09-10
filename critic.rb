require 'sinatra'
require 'supermarket'

configure do
	set :protection, :except => :frame_options
end

before do
	@session = Supermarket::Session.new
end

get '/tv/:app_id' do |app_id|
	@results = @session.comments(app_id, 0, 8).comments_list.to_a
	erb :comments
end
