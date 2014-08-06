class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      create_list_items
      redirect_to rank_list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items.order(votes: :desc)
  end

  def index
    @lists = List.all
  end

  def rank
    list = List.find(params[:id])
    @items = list.items_to_rank

    if @items.nil?
      redirect_to list, notice: 'Ranking complete!'
    end
  end

  private

  def list_params
    params.required(:list).permit(:name)
  end

  def create_list_items
    contents = params[:list][:text_file].read
    # contents needs to be a string where items are delineated by newlines (\n)
    contents.split("\n").each do |item_name|
      @list.items.create!(name: item_name)
    end
  end
end
