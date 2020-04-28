class Admin::HomesController < ApplicationController
	  def top
    # 当日の投稿数（コメントじゃない方）を出す
    @books = Book.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
  end
end
