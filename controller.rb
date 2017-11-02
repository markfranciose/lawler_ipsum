require 'sinatra'
require_relative 'lawler'

get '/' do
	erb :lawler 
end

get '/text' do
	# LawlerIpsum.yet_better(10)
end

get '/paragraphs/:number' do
	p params
	p number = params['number'].to_i
	LawlerIpsum.get_paragraph(number)
end

