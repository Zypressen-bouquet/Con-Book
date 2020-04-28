class Genre < ApplicationRecord
  has_many :books
  has_many :users
  has_many :book_comments
  has_many :book_favorite

  enum genre_status: {true: true, false: false}
  validates :genre ,presence: true
  validates :genre_status, presence: true
end
