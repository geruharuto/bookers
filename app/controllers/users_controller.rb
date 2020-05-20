class UsersController < ApplicationController
  def show#ヘッダーのHomeで反応
  	@user = User.find(params[:id]) #ユーザーを探す,
  	@books = current_user.books#上のユーザーの持ってる本を全部出す」
    @book = Book.new
   
  end
  def edit#左側のスパナで反応
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
end