class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topic = Topic.new
    @topics = Topic.all

    @users = User.find(current_user.id).followed_users
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
    @users = User.find(current_user.id).followers
    @topic_find = Topic.new
  end


  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    @topics = Topic.all
    @topic.save

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
      params.require(:topic).permit(:content, :image)
    end

    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
