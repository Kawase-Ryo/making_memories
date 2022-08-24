class CommentsController < ApplicationController

    # ユーザーがサインインしていない状態でコメントをしても、誰がコメントしたか分からない。なのでauthenticate_user!を使ってサインイン済みユーザーのみにアクセス許可を与える
    before_action :authenticate_user!
    
    # comments#create、つまりcommentsコントローラーのcreateアクションを処理するように指定
    def create
        @comment = Comment.new(comment_params)
        @post = @comment.post
        if @comment.save
          respond_to :js
        else
          flash[:alert] = "コメントに失敗しました"
        end
      end

      def destroy
        @comment = Comment.find_by(id: params[:id])
        @post = @comment.post
        if @comment.destroy
          respond_to :js
        else
          flash[:alert] = "コメントの削除に失敗しました"
        end
      end
    
    private
      def comment_params
          params.required(:comment).permit(:user_id, :post_id, :comment)
      end
end
