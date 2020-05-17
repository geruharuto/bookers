class BooksController < ApplicationController
	def new
        @book = Book.new
    end
    def create
        @book = Book.new(user_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_path(@user.id)
    end
    def index
    end
    def show
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_index #全ユーザーの本一覧
    end
    private
    def user_params
        params.require(:user).permit(:name, :introduction)
    end
end
