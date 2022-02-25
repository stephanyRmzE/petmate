class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    return true
  end

  def update?
    record.id == user.id
  end

  def accept?
    record.pet.user.id == user.id
  end

  def reject?
    record.pet.user.id == user.id
  end

  def destroy?
    record.id == user.id
  end
end
