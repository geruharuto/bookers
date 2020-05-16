class BooksController < ApplicationController
	def top
	end
	def new
    end
    def create
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
end
