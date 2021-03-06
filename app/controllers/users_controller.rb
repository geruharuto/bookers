class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :edit_params, only: [:edit]

  def show#ヘッダーのHomeで反応
    @user = User.find(params[:id]) #ユーザーを探す,
  	@books = @user.books#ユーザーの持ってる本を全部出す」
    @book = Book.new
  end
  def edit#左側のスパナで反応
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(current_user.id), notice: "You have creatad book successfully."
    else
       render :edit
    end
  end
  def index
    @users = User.all #ヘッダーのusers
    @user = current_user #ログインしている自分
    @book = Book.new#ブックのクリエイト画面
  end
  private
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def edit_params
        show
        if current_user != @user
           redirect_to user_path(current_user.id)
       end
    end
end 