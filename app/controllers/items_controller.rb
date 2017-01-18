class ItemsController < ApplicationController
	before_action :find_item, only: [:edit, :update, :show, :delete]
	def index
		@items = Item.all
	end

	def edit
		@item = Item.find(find_item)
	end

	def new
		@item = Item.new
	end

	def create 
		@item = Item.create(item_params)
		if @item.save
			UserMailer.welcome_email().deliver_later
			flash[:notice] = "Successfully created item!"
      		redirect_to items_path
      	else
      		flash[:alert] = "Error Creating Item"
      		render "new"
      	end
    end

    private

	  def item_params
	    params.require(:item).permit(:title, :description)
	  end

	  def find_item
	    @Item = Item.find(params[:id])
	  end
end