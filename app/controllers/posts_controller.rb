class PostsController < ApplicationController
  # 未ログインでも index/show を閲覧可能にする
  before_action :authenticate_user!, except: [:index, :show, :mypage]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  # ★ 自分の投稿一覧（マイページ）
  def mypage
    # ログイン必須
    redirect_to new_user_session_path, alert: "ログインしてください" and return unless user_signed_in?

    @posts = current_user.posts.order(created_at: :desc)
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

  # 投稿者本人だけが編集/更新/削除できる
  def correct_user
    unless @post.user == current_user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :is_anonymous)
  end
end