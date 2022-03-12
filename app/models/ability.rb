# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.present?

      can :manage, :all if user.admin == true

      can :manage, Absence if user.manager == true
      can :manage, Disease if user.manager == true

      can :read, Absence
      can :create, Absence
      can :read, Disease
      can :create, Disease
      
      can :manage, Absence do |absence|
        absence.user == user
      end
      can :manage, Disease do |disease|
        disease.user == user
      end

      can :manage, Howto if user.manager == true
      can :read, Howto
    end

  end
end
