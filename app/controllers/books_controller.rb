class BooksController < ApplicationController
    def index
      render json: Book.all, status: 200
      #code
    end
end
