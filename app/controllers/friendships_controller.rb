class FriendshipsController < ApplicationController

	before_filter :authenticate_user!

  def index
    @friends = current_user.friends
    @pending_invited_by = current_user.pending_invited_by
    @pending_invited = current_user.pending_invited
  end

  def create
    @friend = User.find(params[:id])
    @friendship_created = current_user.invite(@friend)
    if @friendship_created
      redirect_to users_path, :notice => "Your friend request is pending"
    end
  end

  def update
    friend = User.find(params[:id])
    current_user.approve(friend)
    redirect_to friendships_path, :notice => "You are now friends!"
  end

  def destroy
    @friend = User.find(params[:id])
    @friendship = current_user.send(:find_any_friendship_with, @friend)
    if @friendship
      @friendship.delete
      @removed = true
      redirect_to users_path, :notice => "You are no longer friends!"
    end
  end

  def createblock
    @friend = User.find(params[:id])
    current_user.block @friend

    redirect_to users_path, :notice => "You have blocked #{@friend.first_name}"
  end

end
