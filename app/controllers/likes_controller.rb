class LikesController < ApplicationController

  # authenticate_user!を使ってサインイン済みユーザーのみにアクセス許可を与えるようにする
  before_action :authenticate_user!

  def create
      @like = current_user.likes.build(like_params)
      @post = @like.post
      if @like.save
        respond_to :js
      end
    end

    def destroy
      @like = Like.find_by(id: params[:id])
      @post = @like.post
      if @like.destroy
        respond_to :js
  # respond_toは返却するレスポンスのフォーマットを切り替えるためのメソッド
      end
    end
  
  private
    def like_params
      params.permit(:post_id)
    end

end
