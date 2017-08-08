require_relative 'config/environment'
require_relative 'models/textanalyzer.rb'

class App < Sinatra::Base

get '/' do
  erb :index
end

post '/' do
  @analyzed_text = TextAnalyzer.new(params[:user_text])
  @returnVal = @analyzed_text.most_used_letter
  @most_used_letter = @returnVal[0]
  @num_times = @returnVal[1]


  erb :results
end


end
