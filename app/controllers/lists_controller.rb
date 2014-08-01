class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)
    contents = params[:list][:text_file].read
    @list.populate!(contents)

    redirect_to rank_list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items.order(votes: :desc)
  end

  def rank
    list = List.find(params[:id])
    @items = list.items_to_rank

    redirect_to list if @items.nil?
  end

  private

  def list_params
    params.required(:list).permit(:name)
  end
end
