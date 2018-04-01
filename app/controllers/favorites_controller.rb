class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = current_user
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to user
  end

  def destroy
    user = current_user
    micropost = Micropost.find(params[:micropost_id])
    current_user.clear_favorite(micropost)
    flash[:success] = 'お気に入りを解除しました'
    redirect_to user
  end
end
