class BooksController < ApplicationController

  Suc_create = "Book was successfully created."
  Suc_update = "Book was successfully updated."

  def top
  end

  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = Suc_create
      redirect_to book_path(@book.id)
    else
      # redirect_to '/books'
      render:index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = Suc_update
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  #ストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
