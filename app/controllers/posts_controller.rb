class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  # ★ マイページ（投稿一覧＋グラフ）

  def mypage
    redirect_to new_user_session_path, alert: "ログインしてください" and return unless user_signed_in?
  
    # 投稿一覧（表示用）
    @posts = current_user.posts.order(created_at: :desc)
  
    # カテゴリ別の集計（ORDER を含ませない）
    @category_data = current_user.posts.group(:category).count
  end

  # ★ カレンダー表示
  def calendar
    redirect_to new_user_session_path, alert: "ログインしてください" and return unless user_signed_in?

    @date = params[:month] ? Date.parse(params[:month]) : Date.today

    @posts = current_user.posts.where(
      created_at: @date.beginning_of_month..@date.end_of_month
    )
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless @post.user == current_user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :is_anonymous)
  end
end