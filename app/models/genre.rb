class Genre < ApplicationRecord
  has_many :books

  enum genre_status: {true: true, false: false}
  validates :genre ,presence: true
  validates :genre_status, presence: true
end
