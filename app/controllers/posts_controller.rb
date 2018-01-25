class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:created_at)

    @posts.first.update_attribute("title", "SPAM")
    @posts.each.with_index do |post,i|
      if i % 5 == 0
        post.update_attribute("title", "SPAM")
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
