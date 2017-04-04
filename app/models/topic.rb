class Topic < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, TopicUploader #deviseの設定配下に追記
end
