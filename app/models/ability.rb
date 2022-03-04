# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.present? && user.admin == true

    if user.present?
      can :manage, Absence do |absence|
        absence.user == user
      end
    end

  end
end
