class BooksController < ApplicationController
	def index
		@books=Book.all
		@book=Book.new
		@user=User.find(current_user.id)
	end

	def show
		@book_show=Book.find(params[:id])
		@user=User.find(current_user.id)
		@book=Book.new
		@user_show = User.find_by(id: @book_show.user_id)
	end

	def create
		@book=Book.new(book_params)
		@books=Book.all
		@book.user_id=current_user.id
		@user=User.find(current_user.id)
		if @book.save
	    	redirect_to books_path, notice:'Book was successfully created.'
	    else
	    	render :index
	    end
	end

	def edit
		@book=Book.find(params[:id])
		@user=User.new
		if @book.user_id==current_user.id
		else
			redirect_to books_path
		end
	end

	def update
      @book = Book.find(params[:id])
      @user=User.new
	  if @book.update(book_params)
	    redirect_to book_path(@book), notice:'Book was successfully updated.'
	  else
	  	render :edit
	  end
    end

    def destroy
    	@book=Book.find(params[:id])
    	@books=Book.all
    	@user=User.find(current_user.id)
    	if @book.destroy
    		redirect_to books_path, notice:'Book was successfully destroied'
    	else
    		render :index
    	end

    end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
