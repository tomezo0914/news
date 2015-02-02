class WelcomeController < ApplicationController
  def index
    @latest_news = Post.all
  end
end
