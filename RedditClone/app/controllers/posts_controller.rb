class PostsController < ApplicationController
    before_action :require_login

   def index
    @post = Post.all
    render :index
   end

   def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render :show
   end

   def new
    @post = Post.new
    @sub = Sub.find(params[:sub_id])
    render :new
   end

   def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
        if @post.save
            params[:post][:subs_id].each do |s_id|
                Post_sub.create(post_id: @post.id, sub_id: s_id )
            end
            redirect_to sub_url(@post.sub_id)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

   def edit
    @post = Post.find(params[:id])
    render :edit
   end

   def update
    @post = current_user.subs.posts.find(params[:id])
    if @post.update(post_params)
        redirect_to post_url(@post)
    else
        flash[:errors] = @post.errors.full_messages
        render :edit
   end
end

   def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy
        redirect_to sub_url(@post.sub_id)
    else
        flash[:errors] = ["You aren't the owner of this post"]
        redirect_to posts_url
    end
   end

   def post_params
    params.require(:post).permit(:title, :url, :content, :subs_id)
   end



end
