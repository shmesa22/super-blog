class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at ASC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: "El post ha sido creado"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: "El post ha sido modificado"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to root_path, notice: "El post ha sido eliminado"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
