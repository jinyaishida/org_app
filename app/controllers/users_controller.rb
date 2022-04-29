class UsersController < ApplicationController

  def edit
  end

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts
  end


end
