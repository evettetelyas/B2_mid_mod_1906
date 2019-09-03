class AuthorsController < ApplicationController

  def show
      @author = Author.find(params[:id])
      @avg_pages = @author.avg_pages
  end

end