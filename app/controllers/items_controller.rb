class ItemsController < ApplicationController
  def update
    item = Item.find(params[:id])
    item.upvote

    redirect_to rank_list_path(item.list)
  end
end
