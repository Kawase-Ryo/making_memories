class Post < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  #dependent: :destroy投稿が削除されたら、その投稿に紐づくいいねも削除

  accepts_nested_attributes_for :photos

  # user_idとpost_idが一致するlikeを探し、なければnilを返す
  def liked_by(user)
      # user_idが一致するlikeを検索する
      Like.find_by(user_id: user.id, post_id: id)
  end
  
end