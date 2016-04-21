class BooksController < ApplicationController
    def index
      @books = Book.all
      if params[:rating]
        @books = Book.where(rating: params[:rating])
      end
      render json: @books, status: 200
      #code
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        render json: @book, status: 201, location: @book
      else
        render json: @book.errors, status: 422
      end
    end

    private
     def book_params
       params.require(:book).permit(:title, :rating)
     end
end
