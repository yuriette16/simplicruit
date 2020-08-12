class SkillRequirementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end

  def edit_all?
    true
  end

  def update_all?
    true
  end
end
