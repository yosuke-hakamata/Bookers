class UsersController < ApplicationController
  def index
  	@users=User.all
  	@book=Book.new
  	@user=User.find(current_user.id)
  end
  def show
  	@user=User.find(params[:id])
  	@books=@user.books.page(params[:page]).reverse_order
  	@book=Book.new
  end
  def edit
  	@user=User.find(params[:id])
  	@book=Book.new
  	if @user.id==current_user.id
  	else
  		redirect_to user_path(current_user)
  	end
  end
  def update
  	@user = User.find(params[:id])
  	@book=Book.new
    if @user.update(user_params)
    	flash[:success]="User was successfully updated"
    	redirect_to user_path(@user)
    else
    	flash.now[:danger]="error !"
    	render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
 end
