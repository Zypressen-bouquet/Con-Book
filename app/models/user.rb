class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy
  # コメント機能

  has_many :book_comments, dependent: :destroy

  # いいね機能
  has_many :book_favorites, dependent: :destroy


  validates :email, :presence => true
  validates :name, :presence => true,length: {minimum:2, maximum:20}

  def active_for_authentication?
    super && (self.status == true)
  end
end
