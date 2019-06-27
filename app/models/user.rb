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

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    on: :create #ステップフォームでstep2以降updateアクションが動く際にcan't be blank!のエラーが発生してしまうのを防ぐためcreateアクションに限定
  validates :password, presence: true, length: { minimum: 6 },
                    on: :create #ステップフォームでstep2以降updateアクションが動く際にcan't be blank!のエラーが発生してしまうのを防ぐためcreateアクションに限定


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

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all #全て表示
    end
  end

end
