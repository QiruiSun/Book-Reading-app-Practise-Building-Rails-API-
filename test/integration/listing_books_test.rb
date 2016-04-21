require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
    setup do
      @genre = Genre.create!(name: "Science Fiction")
      @genre.books.create!(title: 'Harry Potter', rating: 5)
      @genre.books.create!(title: 'Enders Game', rating: 4)
    end
    test "listing books" do
      get "/books"
      assert_equal 200, response.status
      assert_equal Mime::JSON, response.content_type
      books = json(response.body)[:books]
      assert_equal Book.count, books.size
      book = Book.find(books.first[:id])
      assert_equal @genre.id, book.genre.id
    end

    test "lists top rated books" do
       get '/books?rating=5'

       assert_equal 200, response.status
       assert_equal Mime::JSON, response.content_type
       assert_equal 1, json(response.body)[:books].size
    end
  # test "the truth" do
  #   assert true
  # end
end
