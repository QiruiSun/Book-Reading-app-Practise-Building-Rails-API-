class FinishedBooksController < ApplicationController
    def index
      @books = Book.where.not(finished_at: nil)
      respond_to do |format|
        format.xml { render xml: @books, status: 200}
        format.json { render json: @books, status: 200 }
      end
    end
end
