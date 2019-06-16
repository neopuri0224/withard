class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :games, dependent: :destroy

  has_many :posts, dependent: :destroy

  has_many :user_categories
  has_many :categories, through: :user_categories

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  accepts_nested_attributes_for :games, allow_destroy: true
  accepts_nested_attributes_for :user_categories, allow_destroy: true
  has_one_attached :profile_image

  enum play_time: [:"ほとんど毎日",:"週に４~５日",:"週に2~3日",:"週に1日",:"月に2~3日",:"月に1日以下"]

  #他のステップでユーザの他の情報が保存されたときに入力チェックが起動されないようにする。
  #validates_format_of :name, :without =&gt; /\W/, :allow_blank =&gt; true
  #step2でのみValidationを有効にする。
  #validates_presence_of :name, if: :on_step2_step?

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

end
