class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, :all

    return unless user.persisted?

    can :manage, Post, user_id: user.id
    can :create, Comment
  end
end
