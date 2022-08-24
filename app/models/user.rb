class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #presence: trueは値が空ではないということ確かめるバリデーション
  validates :name, presence: true, length: { maximum: 50 } 
  validates :username, uniqueness: true 
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
