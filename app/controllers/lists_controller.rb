class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path
  end

  def show
    @list = List.includes(bookmarks: :movie).find(params[:id]) 
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks
    # @bookmarks = Bookmark.includes(:movie).where(list_id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
