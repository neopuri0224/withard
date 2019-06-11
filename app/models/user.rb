class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :games, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :user_categories
  has_many :categories, through: :user_categories

  accepts_nested_attributes_for :games, allow_destroy: true
  accepts_nested_attributes_for :user_categories, allow_destroy: true
  has_one_attached :profile_image

  enum play_time: [:"ほとんど毎日",:"週に４~５日",:"週に2~3日",:"週に1日",:"月に2~3日",:"月に1日以下"]

  #他のステップでユーザの他の情報が保存されたときに入力チェックが起動されないようにする。
  #validates_format_of :name, :without =&gt; /\W/, :allow_blank =&gt; true
  #step2でのみValidationを有効にする。
  #validates_presence_of :name, if: :on_step2_step?

end
