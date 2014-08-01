class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)
    contents = params[:list][:text_file].read
    # contents needs to be a string where items are delineated by newlines (\n)
    contents.split("\n").each do |item_name|
      @list.items.create!(name: item_name)
    end

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
