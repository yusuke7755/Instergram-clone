class PicturesController < ApplicationController
  before_action :set_picture, only: [:show ,:edit, :update, :destroy, :cleate]
 
  def index
    if params[:id] == nil
      @pictures = current_user.pictures.order(created_at: "DESC")
      @flg = 0
    elsif params[:id] != nil && params[:id] != current_user.id.to_s
      @pictures = Picture.where(user_id: params[:id]).order(created_at: "DESC")
      @flg = 1
    end
  end

  def new
    @picture = Picture.new
  end
  
  def show
    @picture = Picture.find(params[:id])
  end

  def edit
  end

  def destroy
    @picture.destroy
      redirect_to pictures_path, notice:"投稿を削除しました！"
  end

  def create

    @picture = current_user.pictures.build(picture_params)
    if params[:back]
        render :new
    else
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        redirect_to pictures_path, notice: "新規投稿をしました。"
      else
        render :new
      end
    end

  end

  def update
    if params[:back]
      render :edit
    elsif @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました。"
    else
      render :edit
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:id, :content, :image ,:image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
