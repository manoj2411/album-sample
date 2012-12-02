class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.albums.build
    @user.albums.first.images.build
  end

  def create
    @user = User.new( params[:user])

    if( @user.save)
      redirect_to( @user, notice: 'User and associated Albums created successfully')
    else
      render( action: 'new')
    end
  end

  def update
    @user = User.find( params[:id])

    if( @user.update_attributes( params[:user]))
      redirect_to( @user, notice: 'User and associated Albums updated successfully')
    else
      render( action: 'edit')
    end
  end

  def show
    @user = User.find( params[:id])
  end

  def edit
    @user = User.find( params[:id])
  end

  def destroy
    @user = User.find( params[:id])
    @user.destroy
    redirect_to users_path
  end
end