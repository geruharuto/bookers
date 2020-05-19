class BooksController < ApplicationController
	def new        #左側のNewbookに反応
        @book = Book.new
        @user = User.find(params[:id])
    end
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_path
    end
    def index#ヘッダーのBooksに反応
        @books = Book.all
        @book = Book.new
    end
    def show #自分の本の編集や削除の画面
        @books = Book.find(params[:id])
        @book = Book.new
        @user = User.find(params[:id])
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_index #全ユーザーの本一覧
    end
    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
