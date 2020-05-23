class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :edit_params, only: [:edit]

    def create
        @book = Book.new(book_params)
        @user = current_user
        @book.user_id = @user.id
        if @book.save
            redirect_to book_path(@book), notice: "You have creatad book successfully."
        else
            flash.now[:alert]  = "error"
            @books = Book.all
            render :index
        end
    end
    def index#ヘッダーのBooksに反応
        @books = Book.all
        @book = Book.new
        @user = current_user
    end
    def show #自分の本の編集や削除の画面、他の人ならeditなどでない
        @book = Book.new
        @books = Book.find(params[:id])
        @user = User.find_by(id: @books.user_id)
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)#private処理
           redirect_to book_path(@book.id), notice: "You have updated book successfully."
        else
            render :edit
        end
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path #全ユーザーの本一覧
    end
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
    def edit_params
        show
        if current_user != @user
           redirect_to books_path
       end
    end
end
