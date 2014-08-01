class ItemsController < ApplicationController
  def upvote
    item = Item.find(params[:id])
    item.increment!(:votes)

    redirect_to rank_list_path(item.list)
  end
end
