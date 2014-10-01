class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    # make sure the user is authenticated
    # make sure that the authenticated user is this user
    # binding.pry
    if session[:user_id]
      @user = User.find(params[:id])
      render(:show)
    else
      redirect_to(login_path)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to(users_path)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
