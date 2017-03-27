
class TopicsController < ApplicationController
end
class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy]
  def index
    @com = "これは実験"
  end

  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @topics = Topic.all
    @topic.save
    # クライアント要求に応じてフォーマットを変更

  end


  def edit
    @topic_f = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment.destroy
    @topics = Topic.all
  end

  def update

    @topic_f = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @topics = Topic.all
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
