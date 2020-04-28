class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
    	@genres = Genre.where(genre_status: true)
    	  if params[:genre_id]
    		@genre = Genre.find(params[:genre_id])
    		@books = @genre.books.order(created_at: :desc).page(params[:page]).per(20)
          else
            @books = Book.all
            # binding.pry
          end
        @users = User.find(current_user.id)
        @book = Book.new

    end


	def show
		@genres = Genre.all
	  	@book = Book.find(params[:id])
	    @bookn = Book.new
	    @book_comment = BookComment.new
        @user = current_user

    end


    def create
    	@user = current_user
 	  	@book = Book.new(book_params)
	  	@book.user_id = current_user.id
	    if @book.save
	  		redirect_to book_path(@book.id), notice: "投稿に成功しました"
	  	else
	  		@books = Book.all
	  		render :index
	  	end
	end

	def edit
	  	@book = Book.find(params[:id])
	    if @book.user.id != current_user.id
	      redirect_to books_path
	    end
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
	  	redirect_to books_path, notice: "投稿を削除しました"
	end


	def destroy
	    book = Book.find(params[:id])
	    book.destroy
	    redirect_to books_path
	end

	  private

	  def book_params
	  	params.require(:book).permit(:title, :body, :genre_id)
	  end

	def baria_user
	  unless Book.find(params[:id]).user.id.to_i == current_user.id
		redirect_to books_path
	  end
    end

	end