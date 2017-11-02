require 'sinatra'
require_relative 'lawler'

get '/' do
	@paragraph = LawlerIpsum.yet_better(30)
	erb :lawler 
end

get '/text' do
	LawlerIpsum.yet_better(10)
end


