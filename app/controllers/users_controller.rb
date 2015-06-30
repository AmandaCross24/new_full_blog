 class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def create
  @user = User.new(user_params)
    if @user.save
          flash[:notice] = "Your account was created
          successfully. Please log in."
          redirect_to new_session_path
      else
        flash[:alert] = "There was a problem saving your
        account."
        redirect_to new_user_path
    end
  end
  
    

   def new
      @user = User.new
   end


   def edit
    current_user
   end

   def update
    
      if @user.update_attributes(user_params)
          # Handle a successful update.
      else
        render 'edit'
      end
   end


     def show
      @user = User.all.order('created_at DESC')
     end

  

    def destroy
      current_user
      if @user.destroy
      flash[:notice] = "Your account was successfully deleted."
      redirect_to root_path
      else
        flash[:alert] = "There was a problem deleting your account."
        redirect_to destroy_user_path
      end
     end

   

     private


  def current_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password, :fname, :lname)
  end

end