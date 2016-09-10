class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    if params[:back]
      @post = Post.new(posts_params)
    else
      @post = Post.new
    end
    
#    @post = Post.new
  end
  
  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path, notice: "作成しました！"
    else
      render action: 'new', notice: "作成しました”！"
    end

#    Post.create(posts_params)
#    redirect_to posts_path, notice: "作成しました”！"
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
    redirect_to posts_path, notice: "編集しました！"
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました！"
  end
  
  def confirm
    @post = Post.new(posts_params)
    render :new if @post.invalid?
  end

  private
    def posts_params
      params.require(:post).permit(:title, :content)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
end
