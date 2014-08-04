require 'sinatra'
require 'faker'
require 'data_mapper'

DataMapper.setup(
  :default, 'mysql://root@localhost/Company_Website')

class Post
  include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text, :lazy=>false
end

class Hero
  include DataMapper::Resource
    property :id, Serial
    property :name, String
    property :health, Float
    property :attack, Integer
    property :defence, Integer
    property :speed, Integer
end

DataMapper.finalize.auto_upgrade!

get '/' do 
  erb :title, layout: :site_layout
end

get '/menu' do
  erb :menu, layout: :site_layout
end

get '/show_post' do
  @posts = Post.all 
  erb :show_post, layout: :site_layout
end

get '/create_post' do
  erb :create_post, layout: :site_layout
end

post '/create_post' do
  @posts = Post.create params[:post]
  redirect to('/show_post')
end

get '/edit_delete/:id' do
  @posts = Post.get params[:id]
  erb :edit_delete, layout: :site_layout
end

put '/edit_delete/:id' do
  @posts = Post.get params[:id]
  @posts.update params[:post]
  redirect to('/show_post')
end

delete '/delete_post/:id' do
  @posts = Post.get params[:id]
  @posts.destroy
  redirect to('/show_post')
end

get '/mission_statement' do
  erb :mission_statement, layout: :site_layout
end

get '/game' do
  erb :game, layout: :site_layout
end


















