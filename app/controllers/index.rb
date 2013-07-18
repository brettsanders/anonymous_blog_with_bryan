get '/' do
  @tags = Tag.all
  @posts = Post.all
  erb :index
end
