class BooksController < ApplicationController

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path(@book)
    end
    def index#ヘッダーのBooksに反応
        @books = Book.all
        @book = Book.new
        @user = current_user
    end
    def show #自分の本の編集や削除の画面
        @books = Book.find(params[:id])
        @book = Book.new
        @user = User.find_by(id: @books.user_id)
    end
    def edit
        @book = Book.user_id
    end
    def update
        book = book.user_id
        book.update
        redirect_to book_path(user.id)
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path #全ユーザーの本一覧
    end
    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
