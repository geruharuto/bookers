class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #ユーザーを探す
  	@books = @user.books#上のユーザーの持ってる本を全部出す
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  end
end

#where　指定したものを探してくる　要検索！
#モデルのカラム：一致させたいデータ