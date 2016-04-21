class ChangeReviewColumnName < ActiveRecord::Migration
  def change
    rename_column :books, :reivew, :review
  end
end
