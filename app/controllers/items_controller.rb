class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
      @user = User.all
  end
     

  def new
  end

  def show
  end

  def edit
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
