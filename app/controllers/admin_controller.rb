class AdminController < ApplicationController
  def index
  end

  def edit
    @posts = Post.all
  end

  def post_new
    render 'edit_post'
  end

  def post
    @post = Post.where(id: params[:post_id]).first

    render 'edit_post'
  end

  def post_update
    if params[:post_id].blank?
      @post = Post.new
    else
      @post = Post.where(id: params[:post_id]).first
    end

    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.author_id = 1
    @post.save!

    render 'edit_post'
  end
end
