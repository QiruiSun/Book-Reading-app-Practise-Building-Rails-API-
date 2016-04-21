require 'test_helper'

class DeleteBookTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create!(title: 'Harry Potter', rating: 5)
  end
  test 'delete books' do
    delete "/books/#{@book.id}"

    assert_equal 204, response.status
  end
end
