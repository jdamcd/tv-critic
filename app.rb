require 'sinatra'
require 'supermarket'
require 'net/http'

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

get '/android/:app_id' do |app_id|
	opts = {'login' => ENV["GOOGLE_LOGIN"], 'password' => ENV["GOOGLE_PASSWORD"]}
	session = Supermarket::Session.new(opts)
	
	@results = session.comments(app_id, 0, 10).comments_list.to_a.map { |c| Comment.new(c.text, c.rating) }
	if @results.size > 0
		erb :comments
	else
		no_results
	end
end

get '/ios/:app_id' do |app_id|
	response = Net::HTTP.get("itunes.apple.com", "/us/rss/customerreviews/mostRecent/id=" + app_id + "/json")
	reviews = JSON.parse(response)["feed"]["entry"]

	begin
		@results = reviews[1,10].map { |r| Comment.new(r["content"]["label"], r["im:rating"]["label"]) }
		erb :comments
	rescue
		no_results
	end
end

def no_results 
	cache_control :no_cache, :max_age => 0
	erb :no_results
end

class Comment
	attr_accessor :text
	attr_accessor :rating

	def initialize(text, rating)
		@text = text
		@rating = rating
	end
end
