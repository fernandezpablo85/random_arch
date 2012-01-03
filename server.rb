require 'rubygems'
require 'twitter'
require 'sinatra'
require 'sinatra/reloader'
require 'erb'

def transform_status status
  "{ \"user\" : \"#{status.from_user.gsub('\"', '\'')}\" , \"text\" : \"#{status.text.gsub('"', '\'')}\" }"
end

get '/' do
  @tweets = Twitter.search("#thearchitect", :rpp => 100).map { |status|  transform_status(status)}
  erb :home
end