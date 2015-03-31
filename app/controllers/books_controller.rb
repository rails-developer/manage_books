class BooksController < ApplicationController
  def show
    @book =  Book.where(id: params[:id])
  end
end
