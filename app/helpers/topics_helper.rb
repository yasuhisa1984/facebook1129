module TopicsHelper
  def comment_feeds(topic)
    comments = topic.comments #その投稿のidに紐づくcommentを全て取得します。
    # commentを1つずつ取り出し、bodyの内容でpタグを出力する
    comments.each do |comment|
        comment#.user.name + comment.content
    end
  end

  def comment(topic)
    comments = topic.comments #each投稿のそれぞれのidに紐づくcommentを全て取得します。
    # commentを1つずつ取り出し、bodyの内容でpタグを出力する
  end
end
