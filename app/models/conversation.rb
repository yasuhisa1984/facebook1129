class Conversation < ActiveRecord::Base
  #class_name: 'sender'。recipientテーブルが存在しないため記載する
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  #validates_uniqueness_of は、属性の値が一意であることを検証するメソッドです
  validates_uniqueness_of :sender_id, scope: :recipient_id

  #チェックする仕組みとして送り手と受け手の「組み合わせ」で判定する
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end
end
