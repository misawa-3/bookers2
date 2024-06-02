class PostImagesController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(post_image_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
     @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    book = Book.find(params[:id])
    book.find(params[:id]).destroy
    redirect_to post_images_path
  end


  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :bodys)
  end

end
