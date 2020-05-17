class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #ユーザーを探す
  	@books = @user.books#上のユーザーの持ってる本を全部出す
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  def index
    @users = User.all
  end
end

private
def user_params
   params.require(:user).permit(:name, :introduction)
end
#where　指定したものを探してくる　要検索！
#モデルのカラム：一致させたいデータ