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
    # @list = List.includes(bookmarks: :movie).find(params[:id]) #.includes(bookmarks: :movie): This part is eager loading associations. It's fetching the List object along with 
    # its associated bookmarks, and for each bookmark, it's also including the associated movie. This helps to avoid N+1 query issues by loading associated records 
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks
    # @bookmarks = Bookmark.includes(:movie).where(list_id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :url)
  end
end
