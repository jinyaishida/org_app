class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id 
      redirect_to action: :index
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      redirect_to root_path
    else
      redirect_to action: :index
    end
      @post.destroy
  end

  def search
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:item_name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:item_name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:item_name_cont_any] = squished_keywords.split(" ")
    end
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  private
  def post_params
    params.require(:post).permit(:item_name, :brand_id, :category_id, :purchase_date_id, :price, :weight, :etc, :good_point, :bad_point, :cost_rationg, :function_rating, :weight_rating, :design_rationg, :recommend_rating, :image).merge(user_id: current_user.id)
  end
  
end