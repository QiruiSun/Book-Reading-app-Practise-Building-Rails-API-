class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating,
             :review, :genre_id, :amazon_id, :author
end
