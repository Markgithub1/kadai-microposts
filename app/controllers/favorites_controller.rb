class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_micropost

  def create
    current_user.favorite(@micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfavorite(@micropost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
end