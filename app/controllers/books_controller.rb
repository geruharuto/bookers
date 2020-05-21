class BooksController < ApplicationController

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book), notice: "You have creatad book successfully."
        else
            flash.now[:alert]  = "error"
            render :index
        end
    end
    def index#ヘッダーのBooksに反応
        @books = Book.all
        @book = Book.new
        @user = current_user
    end
    def show #自分の本の編集や削除の画面、他の人ならeditなどでない
        @books = Book.find(params[:id])
        @user = User.find_by(id: @books.user_id)
        @book = Book.new
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        book = Book.find(params[:id])
        book.update(book_params)#private処理
        redirect_to book_path(book.id)
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path #全ユーザーの本一覧
    end
    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
