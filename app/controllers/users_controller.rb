class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #ユーザーを探す
  	@books = @user.books#上のユーザーの持ってる本を全部出す」
    @book = Book.new
  end#ヘッダーのHomeで反応
  def edit#左側のスパナで反応
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  def index
    @users = User.all #ヘッダーのusersに反応
  end
  private
  def user_params
     params.require(:user).permit(:name, :introduction)
  end
end