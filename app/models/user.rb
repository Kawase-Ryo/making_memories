class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar # :avatarの部分は用途に合わせて :image :photoでも可。今回はプロフィール画像でavatar

  #presence: trueは値が空ではないということ確かめるバリデーション 
  validates :email,        uniqueness: true
  validates :name,         presence: true, length: { maximum: 50 } 
  validates :username,     uniqueness: true, format: { with: /\A[a-z]+\z/, message: "は半角英字で入力して下さい" }
  validates :introduction, presence: false, length: { maximum: 50 } 
  #uniquenessはオブジェクトが保存される直前に、属性の値が一意（unique）であり重複していないことを検証

   #パスワードを入力しなくてもプロフィールの情報を編集できる。またパスワードも編集できる。
  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  #パスワードを入力しなくてもプロフィールの情報を編集できる。またパスワードも編集できる。

end
