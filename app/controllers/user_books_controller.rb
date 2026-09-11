class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[show edit update delete destroy]

  def index
    @user_books = UserBook.joins(:user, :book).includes(:user, :book).order("users.username", "books.title")
  end

  def show
  end

  def new
    @user_book = UserBook.new
  end

  def create
    @user_book = UserBook.new(user_book_params)

    if @user_book.save
      redirect_to user_books_path, notice: "User book was successfully created."
    else
      flash.now[:alert] = @user_book.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user_book.update(user_book_params)
      redirect_to user_books_path, notice: "User book was successfully updated."
    else
      flash.now[:alert] = @user_book.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end

  def destroy
    @user_book.destroy
    redirect_to user_books_path, notice: "User book was successfully deleted."
  end

  private

  def set_user_book
    @user_book = UserBook.find(params[:id])
  end

  def user_book_params
    params.require(:user_book).permit(:user_id, :book_id)
  end
end
