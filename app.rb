require 'sinatra'
require 'supermarket'

require 'rack-cache'
require 'dalli'
require 'memcachier' 

configure do
	set :protection, :except => :frame_options
	if memcache_servers = ENV["MEMCACHE_SERVERS"]
		use Rack::Cache,
    	verbose: true,
    	metastore: "memcached://#{memcache_servers}",
    	entitystore: "memcached://#{memcache_servers}"
	end
end

before do
	cache_control :public, max_age: 1800  # 30 min
end

get '/tv/:app_id' do |app_id|
	opts = {'login' => ENV["GOOGLE_LOGIN"], 'password' => ENV["GOOGLE_PASSWORD"]}
	session = Supermarket::Session.new(opts)
	@results = session.comments(app_id, 0, 10).comments_list.to_a
	erb :comments
end
