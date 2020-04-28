class Book < ApplicationRecord

  belongs_to :genre
  belongs_to :user




# コメント機能
has_many :book_comments, dependent: :destroy
# いいね機能
has_many :book_favorites, dependent: :destroy
        def favorited_by?(user)
            book_favorites.where(user_id: user.id).exists?
        end

  validates :genre_id, presence: true
  validates :title, :presence => true
  validates :body, :presence => true, length: { maximum:400}
end
