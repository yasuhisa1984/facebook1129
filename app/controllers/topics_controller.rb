class UsersController < ApplicationController
end

class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]


  def index
    @topic = Topic.new
    @topics = Topic.all
    @users = User.all

    @topic_find = Topic.new


  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @topic_f = Topic.find(1)
    @comment = @topic_f.comments.build
    #@comment = @topic.comments.build
    @comments = @topic.comments
  end


  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    @topics = Topic.all
    @topic.save

    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)


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
  end

  def update
    @topic.update(topics_params)
    @topics = Topic.all
  end



  def destroy
    @topic.destroy
    @topics = Topic.all
  end


  private
    def topics_params
      params.require(:topic).permit(:content)
    end

    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
