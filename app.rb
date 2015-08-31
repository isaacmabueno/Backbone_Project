require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'larrydavid'
)
#set folder for template to.../views, but
 set :views, File.expand_path('../views', __FILE__)
 set :public, File.expand_path('../public', __FILE__)

get '/' do
    # @key = ENV['API_KEY']
    # puts @key
  erb :ld_everyday
end



# get '/' do

#   # CREATE Larry David DAILY
#   # @lddaily = Lddaily.new
#   # @   .quote = 'Larry''s house has been spray painted by trick-or-treaters he has offended and he''s reporting it to cops] They don''t deserve candy and I don''t deserve this: "Bald Asshole"? That''s a hate crime!'
#   # @lddaily.source = 'Larry David'
#   # @lddaily.save
#   # @lddaily.to_json
#   erb :index
# end

  #GET: list(all)
get '/api/lddailies' do
  Lddaily.all.to_json
end

#GET: by id
get '/api/lddailies/:id' do
  Lddaily.find(params[:id]).to_json
end

# post
# dont think i need this post function
post '/api/lddailies' do

  @is_authorized = false;
  if params[:api_key].nil? == false && params[:api_key] == ENV[API_KEY]
   @is_authorized = true
  end
  if @is_authorized == false
   return {:status => '403', :message => 'not authorized'}.to_json
  end

  request_body = JSON.parse request.body.read.to_s
  Ld
  puts params
  Lddaily.create({
    :quote => params[:quote],
    :source => params[:source]
    }).to_json
end

# patch: update by ID
# don't think i need to search by ID if I'm using this as a READ only...
## The code that follows this may need to be deleted....
patch '/api/lddailies/:id' do

  @is_authorized = false;
  if params[:api_key].nil? == false && params[:api_key] == ENV[API_KEY]
   @is_authorized = true
  end
  if @is_authorized == false
   return {:status => '403', :message => 'not authorized'}.to_json
  end

  request_body = JSON.parse(request.body.read.to_s)
  @id = params[:id]
  @lddaily = LddailyModel.find(@id)
  @lddaily.quote = request.body[:quote]
  @lddaily.source = requent_body[:source]
  @lddaily.save
  @lddaily.to_json
end

put '/api/lddailies/:id' do

  @is_authorized = false;
  if params[:api_key].nil? == false && params[:api_key] == ENV[API_KEY]
   @is_authorized = true
  end
  if @is_authorized == false
   return {:status => '403', :message => 'not authorized'}.to_json
  end

  request_body = JSON.parse(request.body.read.to_s)
  @id = params[:id]
  @lddaily = LddailyModel.find(@id)
  @lddaily.quote = request.body[:quote]
  @lddaily.source = requent_body[:source]
  @lddaily.save
  @lddaily.to_json
end

delete '/api/lddailies/:id' do

  @is_authorized = false;
  if params[:api_key].nil? == false && params[:api_key] == ENV[API_KEY]
   @is_authorized = true
  end
  if @is_authorized == false
   return {:status => '403', :message => 'not authorized'}.to_json
  end

  Lddaily.destroy(params[:id]).to_json
end
