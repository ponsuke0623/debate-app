class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.new(name: params[:name], password: params[:password])
    if @user.save
      session[:user_id] =@user.id
      flash[:notice] = "created your account successfully."
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "wrong something."
      render("users/new")
    end 
  end

  def login_form
  end


  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "logged in successfully."
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "got wrong information."
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end



  def logout
    session[:user_id] = nil
    flash[:notice] = "logged out successfully."
    redirect_to("/login")
  end



  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "updated your information"
      redirect_to("/users/#{@user.id}")
    else 
      @error_message = "got wrong information."
      render("users/edit")
    end
  end

end

