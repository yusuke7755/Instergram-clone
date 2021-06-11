class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index
    @users =User.where.not(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new if @user.invalid?
    end
  end

  def update
    if params[:back]
      render :edit
      redirect_to pictures_path
    elsif @user.update(user_params)
      redirect_to pictures_path, notice: "プロフィール編集しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation,
                                 :comment, :user_name, :my_image, :my_image_cache, :birthday, :gender)
  end
  def set_user
    @user = User.find(params[:id])
  end

end
