class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new

    if user.role == 'admin'
      can :menage, :all?
    end
  end
end
