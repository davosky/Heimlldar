# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.present?

      can :manage, :all if user.admin == true

      can :manage, Absence if user.manager == true
      can :manage, Disease if user.manager == true
      can :manage, Holiday if user.manager == true
      can :manage, Overtime if user.manager == true
      can :manage, Permit if user.manager == true

      can :read, Absence
      can :create, Absence

      can :read, Disease
      can :create, Disease

      can :read, Holiday
      can :create, Holiday

      can :read, Overtime
      can :create, Overtime

      can :read, Permit
      can :create, Permit
      
      can :manage, Absence do |absence|
        absence.user == user
      end

      can :manage, Disease do |disease|
        disease.user == user
      end

      can :manage, Holiday do |holiday|
        holiday.user == user
      end

      can :manage, Overtime do |ovrtime|
        overtime.user == user
      end

      can :manage, Permit do |permit|
        Permit.user == user
      end

      can :manage, Howto if user.manager == true
      can :read, Howto
    end

  end
end
