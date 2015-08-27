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
  @lddaily = Lddaily.new
  @lddaily.quote = 'I don''t like talking to people I know, but strangers I have no problem with.'
  @lddaily.source = 'Larry David'
  @lddaily.save
  @lddaily.to_json
end
# 'let me tell you something. The Penis doesn''t care about race, creed, or skin color. The penis just wants to get to its homeland! It just wants to go home!'

  #GET: list
get '/api/lddailies' do
  Lddaily.all.to_json
end

#GET: by id
get '/api/lddailies/:id' do
  Ldaily.find(params[:id]).to_json
end

#post
post '/api/lddailies' do
  puts params
  Lddaily.create({
    :quote => params[:quote],
    :source => params[:source]
    }).to_json
end

#patch: update by ID
patch '/api/lddailies/:id' do
  lddailies_args = { :quote => params[:quote], :source => params[:source]}
  puts lddailies_args
  @lddaily = Lddaily.find(params[:id])
  @lddaily.update(lddailies_args)
  @lddaily.to_json
end

put '/api/lddailies/:id' do
  lddailies_args = { :quote => params[:quote], :source => params[:source]}
  puts lddailies_args
  @lddaily = Lddaily.find(params[:id])
  @lddaily.update(lddailies_args)
  @lddaily.to_json
end

delete '/api/lddailies/:id' do
  Lddaily.destroy(params[:id]).to_json
end
