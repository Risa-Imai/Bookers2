class BooksController < ApplicationController
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user #ログインしているアカウント
    @book = Book.new #新規投稿
    @books = Book.all #すべての投稿を一覧
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #ログイン中ユーザーIDを取得
    @book.save
    redirect_to books_path
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
