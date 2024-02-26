class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    
    @bookmark.save

    redirect_to list_path(@list)
    # else 
    #   respond_to do |format|
    #     format.html { render "lists/show", status: :unprocessable_entity }
    #     format.js   # You might handle this with a JS response
    # end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
