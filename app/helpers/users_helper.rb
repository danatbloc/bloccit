module UsersHelper

  def are_there_any_user_posts_out_there
    if @posts.empty?
      "#{@user.name} has not submitted any posts yet."
    else
      "Posts"
    end
  end

  def are_there_any_user_comments_out_there
    if @user.comments.empty?
      "#{@user.name} has not submitted any comments yet."
    else
      "Comments"
    end
  end

end
