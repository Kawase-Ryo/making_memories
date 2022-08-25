class PostsController < ApplicationController

  before_action :authenticate_user!
  #サインインしていない状態でnewアクションやcreateアクションを実行しようとすると、サインインページにリダイレクトされる

  before_action :set_post, only: %i(show destroy)
  # 重複するコードがあると冗長なので、before_actionを使ってshowアクションとdestroyアクションが呼ばれる前に@postを読み込むように書き換える

  # newはインスタンスを作成するメソッド
  def new
      @post = Post.new
      @post.photos.build
  end

  def create
      @post = Post.new(post_params)
  # if @post.photos.present?というコードで投稿の写真が存在するか確認
      if @post.photos.present?
  # saveメソッドはオブジェクト（今回の場合@post）をデータベースに保存。redirect_toで指定したページに遷移。今回の場合、投稿が保存されても、されなくてもposts_pathにリダイレクトする
        @post.save
        redirect_to posts_path
        flash[:notice] = "投稿が保存されました"
      else
        @post.save
        redirect_to new_post_path
        flash[:alert] = "投稿に失敗しました"
      end
  end

  def index
    # limitメソッドは取り出すレコード数の上限を指定。Post.limit(10)とすることで、投稿のレコードは最大10個までしか取得できない.N+1問題
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
    redirect_to posts_path
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
