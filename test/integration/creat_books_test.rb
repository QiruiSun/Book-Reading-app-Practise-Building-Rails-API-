require 'test_helper'

class CreatBooksTest < ActionDispatch::IntegrationTest
    test 'create new books' do
      post '/books', { book: {
        title: "Harry Potter",
        rating: 5
        }}.to_json, {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        }
      assert_equal 201, response.status
      book = json(response.body)[:book]
      assert_equal book_url(book[:id]), response.location
      assert_equal Mime::JSON, response.content_type
      assert_equal "Harry Potter", book[:title]
      assert_equal 5, book[:rating].to_i
    end

    test 'does not create book with validate data' do
      post '/books', { book: {
        title: nil,
        rating: 5
        }}.to_json, {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        }
      assert_equal 422, response.status

    end

end
