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

# post/create
# dont think i need this post function
post '/api/lddailies' do
request_body = JSON.parse request.body.read.to_s

  @is_authorized = false;
     if env['HTTP_X_API_KEY'].nil? == false && env['HTTP_X_API_KEY'] == ENV['API_KEY']
       @is_authorized = true
     end
     if @is_authorized == false
       return_message = {
         :status => 'error',
         :message => "Invalid API key"
       }
       halt 401, {
         'Content-Type' => 'application/json'
       }, return_message.to_json
     end
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
     if env['HTTP_X_API_KEY'].nil? == false && env['HTTP_X_API_KEY'] == ENV['API_KEY']
       @is_authorized = true
     end
     if @is_authorized == false
       return_message = {
         :status => 'error',
         :message => "Invalid API key"
       }
       halt 401, {
         'Content-Type' => 'application/json'
       }, return_message.to_json
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
     if env['HTTP_X_API_KEY'].nil? == false && env['HTTP_X_API_KEY'] == ENV['API_KEY']
       @is_authorized = true
     end
     if @is_authorized == false
       return_message = {
         :status => 'error',
         :message => "Invalid API key"
       }
       halt 401, {
         'Content-Type' => 'application/json'
       }, return_message.to_json
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
     if env['HTTP_X_API_KEY'].nil? == false && env['HTTP_X_API_KEY'] == ENV['API_KEY']
       @is_authorized = true
     end
     if @is_authorized == false
       return_message = {
         :status => 'error',
         :message => "Invalid API key"
       }
       halt 401, {
         'Content-Type' => 'application/json'
       }, return_message.to_json
     end

  Lddaily.destroy(params[:id]).to_json
end
