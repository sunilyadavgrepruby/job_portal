class UsersController < ApplicationController

  def index  
    @users = current_user.employees
  end
  
  def new
  end
  
  def create
   
  end
  
  def edit
  end
  
  def dashboard
  end
end
