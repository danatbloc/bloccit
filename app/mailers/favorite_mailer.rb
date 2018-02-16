class FavoriteMailer < ApplicationMailer
  default from: "dafaso1@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@pure-eyrie-71103.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@pure-eyrie-71103.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@pure-eyrie-71103.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)
    headers["Message-ID"] = "<post/#{post.id}@pure-eyrie-71103.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@pure-eyrie-71103.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@pure-eyrie-71103.herokuapp.com>"

    @user = user
    @post = post

    mail(to: user.email, subject: "Your new post: #{post.title}")
  end

end
