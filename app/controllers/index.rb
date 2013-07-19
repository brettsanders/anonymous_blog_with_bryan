get '/' do
  @tags = Tag.all
  @posts = Post.all
  erb :index
end

get '/purecss' do
  @tags = Tag.all
  @posts = Post.all
  erb :purecss
end
