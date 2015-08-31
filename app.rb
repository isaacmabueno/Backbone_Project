require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'larrydavid'
)
#set folder for template to.../views, but
 set :views, File.expand_path('../views', __FILE__)
 set :public, File.expand_path('../public', __FILE__)

get '/ld_everyday' do
  erb :ld_everyday
end



get '/' do
  #CREATE Larry David DAILY
  # @lddaily = Lddaily.new
  # @lddaily.quote = 'Let me tell you something. The Penis doesn''t care about race, creed, or skin color. The penis just wants to get to its homeland! It just wants to go home!'
  # @lddaily.source = 'Larry David'
  # @lddaily.save
  # @lddaily.to_json
  erb :index
end

  #GET: list(all)
get '/api/lddailies' do
  Lddaily.all.to_json
end

#GET: by id
get '/api/lddailies/:id' do
  Lddaily.find(params[:id]).to_json
end

#post
# dont think i need this post function
# post '/api/lddailies' do
#   request_body = JSON.parse request.body.read.to_s
#   Ld
#   puts params
#   Lddaily.create({
#     :quote => params[:quote],
#     :source => params[:source]
#     }).to_json
# end

#patch: update by ID
# don't think i need to search by ID if I'm using this as a READ only...
### The code that follows this may need to be deleted....
# patch '/api/lddailies/:id' do
#   request_body = JSON.parse(request.body.read.to_s)
#   @id = params[:id]
#   @lddaily = LddailyModel.find(@id)
#   @lddaily.quote = request.body[:quote]
#   @lddaily.source = requent_body[:source]
#   @lddaily.save
#   @lddaily.to_json
# end
#
# put '/api/lddailies/:id' do
#   request_body = JSON.parse(request.body.read.to_s)
#   @id = params[:id]
#   @lddaily = LddailyModel.find(@id)
#   @lddaily.quote = request.body[:quote]
#   @lddaily.source = requent_body[:source]
#   @lddaily.save
#   @lddaily.to_json
# end
#
# delete '/api/lddailies/:id' do
#   Lddaily.destroy(params[:id]).to_json
# end
