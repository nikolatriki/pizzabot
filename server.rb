require 'sinatra'
require_relative 'lib/pizzabot/instructions'

get '/' do
  'Hello!'
end

post '/pizzabot' do
  pizzabot = PizzaBot.new(['5x5 (1, 2) (3, 4)'])
  pizzabot.instructions.to_json
end
