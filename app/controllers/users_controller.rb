class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
     if  @current_user.role.include?("admin") 
      @users = User.all.to_a 
     elsif @current_user.role.include?("owner") 
      @users = @current_user.associates.to_a 
     else
      @users = User.find(current_user._id).to_a  
     end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.json {render 'api/v1/users/index'}
    end
  end

  def show
    # puts "params = #{params}"
    # puts "user = #{@user.inspect}"
    @properties = @user.properties
     respond_to do |format|
        format.html 
        format.json {render 'api/v1/users/show'}
     end
  end

  def sign_in(user)
  end

  def edit
    @roles = Role.all.to_a
    @user = User.find(params[:id])  
  end
  
  def update
   @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      respond_to do |format|
        flash[:notice] = "User Updated Successfully!"
        format.js
        format.html {redirect_to after_update_path_for(@user)}
        format.json {respond_with @user}
      end
    else
      respond_to do |format|
        format.js {render :partial=> 'unsave'}
        format.html { return render action: "edit" }
        format.json {render :json => {:error => "Not Updated"}, :status => 412}
      end
    end
  end




 end 

