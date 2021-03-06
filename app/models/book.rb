class Book < ActiveRecord::Base
  scope :finished, -> { where.not(finished_at: nil) }
  validates :title, presence: true
  belongs_to :genre
end
