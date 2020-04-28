class Admin::BooksController < ApplicationController
  before_action :authenticate_admin!
	def index
		@books = Book.all
        @users = current_user
        
	end

	def update
	  	@book = Book.find(params[:id])
	  	if @book.update(book_params)
	  		redirect_to @book, notice: "編集に成功しました"
	  	else 
	  		render :edit
	  	end
	end


	def delete
	  	@book = Book.find(params[:id])
	  	@book.destroy
	  	redirect_to admin_books_path, notice: "投稿を削除しました"
	end


	def destroy
	    book = Book.find(params[:id])
	    book.destroy
	    redirect_to admin_books_path
	end

	  private

	  def book_params
	  	params.require(:book).permit(:title, :body, :genre_id)
	  end



end
