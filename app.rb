require 'sinatra'
require 'supermarket'

configure do
	set :protection, :except => :frame_options
end

before do
	opts = {'login' => ENV["GOOGLE_LOGIN"], 'password' => ENV["GOOGLE_PASSWORD"]}
	@session = Supermarket::Session.new(opts)
end

get '/tv/:app_id' do |app_id|
	@results = @session.comments(app_id, 0, 10).comments_list.to_a
	erb :comments
end
