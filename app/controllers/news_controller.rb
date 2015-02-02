class NewsController < ApplicationController
  def show
    @post = Post.where(id: params[:news_id]).first
  end
end
