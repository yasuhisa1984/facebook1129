class TopicsController < ApplicationController
class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy]
  def index
    @com = "これは実験"
  end

  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end


  def edit
    @topic_f = Topic.find(1)
    @comment = @topic_f.comments.build
  end

  def destroy
    @comment.destroy
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
