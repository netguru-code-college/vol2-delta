class Ability
  # => include CanCan::Ability

  def initialize(user)
    user || User.new

    can :menage, :all? if user.role == 'admin'
  end
end
