# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.present?

      can :manage, :all if user.admin == true

      can :manage, Absence if user.manager == true

      can :read, Absence
      can :create, Absence
      
      can :manage, Absence do |absence|
        absence.user == user
      end
    end

  end
end
