class Ability
  include CanCan::Ability

  #cancanを使ったRailsAdminで作成したページへのアクセス制限
  def initialize(user)
    #adminがtrueかどうかを判定
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
  end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
