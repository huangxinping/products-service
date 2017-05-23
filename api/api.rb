require 'grape'

class API < Grape::API
	format :json

	get '/' do
		'Hello world'
	end
end
