class FavoritesController < ApplicationController
 
  def index
    @favorites = current_user.favorites
  end

  def create
        favorite = current_user.favorites.create(picture_id: params[:picture_id])
        redirect_to pictures_path(id: params[:user_id]) ,notice:"お気に入りに追加しました。"     
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "お気に入りからはずしました。"  
  end

end
