class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.create!(name: params[:list][:name])
    contents = params[:list][:text_file].read
    @list.populate!(contents)

    redirect_to rank_list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items.order(votes: :desc)
  end

  def rank
    @list = List.find(params[:id])

    if @list.items_to_rank
      @item_1 = @list.items_to_rank[0]
      @item_2 = @list.items_to_rank[1]
    else
      redirect_to @list
    end
  end
end
