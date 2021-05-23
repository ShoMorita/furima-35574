class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def updete
  end

  def destroy
  end

  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  

end
