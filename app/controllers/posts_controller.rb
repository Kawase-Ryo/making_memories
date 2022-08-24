class PostsController < ApplicationController

  before_action :authenticate_user!
  #サインインしていない状態でnewアクションやcreateアクションを実行しようとすると、サインインページにリダイレクトされる

  before_action :set_post, only: %i(show destroy)
  # 重複するコードがあると冗長なので、before_actionを使ってshowアクションとdestroyアクションが呼ばれる前に@postを読み込むように書き換える

  def new
      @post = Post.new
      @post.photos.build
  end

  def create
      @post = Post.new(post_params)
      if @post.photos.present?
        @post.save
        redirect_to root_path
        flash[:notice] = "投稿が保存されました"
      else
        redirect_to root_path
        flash[:alert] = "投稿に失敗しました"
      end
    end

  def index
      @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
  end

  def show
  end
  
  def destroy
    # 投稿したユーザーと現在サインインしているユーザーが等しければ、真を返す条件式
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    # @post.destroyが真だったら、「投稿が削除されました」というフラッシュメッセージを表示
    end
    redirect_to root_path
  end
  
  private
     def post_params
        params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
     end

     # set_postというメソッドを追加する
     def set_post
      @post = Post.find_by(id: params[:id])
    end
end
