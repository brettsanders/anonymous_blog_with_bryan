# Index
get '/posts' do
  @posts = Post.all
  erb :posts
end

# New
get '/create_post' do
  @tags = Tag.all
  erb :create_post
end

# Create (with Tags)
post '/create_post' do
  new_tags = params[:tag][:name]
  all_tags_array = new_tags.split(',') # array

  all_tags_array += params[:old_tags].values if params[:old_tags]# returns array

  @post = Post.new(params[:post])

  all_tags_array.each do |tag|
    new_tag = Tag.find_or_create_by_name(tag)
    @post.tags << new_tag
  end

  @post.save
   
  redirect "/post/#{@post.id}"
end

# Show
get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  @tag = Tag.find_by_id(params[:id])

  erb :post_view
end

#Edit
get '/post/:id/edit' do
  @post = Post.find(params[:id])
  @tags = Tag.all
  erb :edit_post
end

# Update
post '/post/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  @post.tags.destroy_all

  new_tags = params[:tag][:name]
  all_tags_array = new_tags.split(',') # array

  all_tags_array += params[:old_tags].values if params[:old_tags]# returns array

  all_tags_array.each do |tag|
    new_tag = Tag.find_or_create_by_name(tag)
    @post.tags << new_tag
  end

  @post.save

  redirect to("/post/#{@post.id}")
end

# Delete
post '/post/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'  
end


























