class FavoritesController < ApplicationController
   before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav_in(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to likes_user_path(current_user.id)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav_out(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to likes_user_path(current_user.id)
  end
end
