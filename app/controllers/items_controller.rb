class ItemsController < ApplicationController
	before_action :find_item, only: [:edit, :update, :show, :delete]
	def index
		@items = Item.all
	end

	def edit
	end

	def new
		@item = Item.new
	end

	def create 
		@item = Item.create(item_params)
		if @item.save
			flash[:notice] = "Successfully created item!"
      		redirect_to item_path(@item)
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