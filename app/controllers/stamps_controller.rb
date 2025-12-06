class StampsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @stamp = @post.stamps.find_or_initialize_by(user: current_user)

    if @stamp.persisted?
      # 既に押している場合
      if @stamp.stamp_type == params[:stamp][:stamp_type]
        # 同じ種類 → 削除（再選択状態へ）
        @stamp.destroy
      else
        # 別種類 → 更新
        @stamp.update(stamp_type: params[:stamp][:stamp_type])
      end
    else
      # 新規作成
      @stamp.update(stamp_params)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path }
    end
  end

  def destroy
    @stamp = @post.stamps.find_by(user: current_user)
    @stamp&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def stamp_params
    params.require(:stamp).permit(:stamp_type)
  end
end