class ItemsController < ApplicationController
  def update
    item = Item.find(params[:id])
    @list = item.list

    item.rank += 1
    item.save!

    redirect_to rank_list_path(@list)
  end
end
