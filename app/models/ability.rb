class Ability
  include CanCan::Ability
=begin
    :create = new, create
    :read = index, show
    :update = edit, update
    :destroy = destroy
    :manage = new, create, index, show, edit, update, destroy
=end

  def initialize(user)
        if user.nil?
            can :read, [Category, Article]
        elsif user.role? "admin"
            can :manage, [Category, Article, Comment]
        elsif user.role? "moderator"
            can :read, [Category, Article, Comment]
            can [:update, :destroy], Comment
        elsif user.role? "author"
            can :read, [Category, Article, Comment]
            can :create, [Article, Comment]
            can :update, Article
            can :destroy, Comment do |comment|
            can comment.user_id == user.id || comment.article.user_id == user.id
            end
        elsif user.role? "user"
            can :read, [Category, Article]
            can [:create, :read], Comment
            can [:update, :destroy], Comment do |comment|
                comment.user_id == user.id
            end
        end
    end
    
end
