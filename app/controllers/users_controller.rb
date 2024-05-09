class UsersController < ApplicationController
  def user_page
    @users = User.all
    render({ :template => "templates/user_page" })
  end
  def add_user
    new_user = User.new
    new_user.username = params.fetch("input_username")
    new_user.save

    redirect_to("/users/"+ new_user.username)
  end
  def user_details
    user_name = params.fetch("user_name")
    @user = User.where({ :username => user_name }).at(0)

    render({ :template => "templates/user_details" })
  end
  def update_user 
    user_name = params.fetch("user_name")
    user = User.where({ :username => user_name }).at(0)
    user.username = params.fetch("input_username")
    user.save

    redirect_to("/users/"+ user.username)
  end  
end
