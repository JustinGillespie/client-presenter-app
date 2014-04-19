class UsersController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		@clients = Client.all
	  @user = User.new
	end

	def edit
		@clients = Client.all
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to users_path, notice: "User Created!"
	  else
	    render "new"
	  end
	end

	def update
		if @user.update(user_params)
	  	redirect_to root_url, notice: 'User was successfully updated.'
		else
	  	render action: 'edit'
		end
	end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was removed.' }
      format.json { head :no_content }
    end
  end

private
	
	def set_project
		@user = User.find(params[:id])
  end

	def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :client_id)
  end

end
