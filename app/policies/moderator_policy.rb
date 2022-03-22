class ModeratorPolicy < ApplicationPolicy

  def new?
    (user.present? && user.super_user == true)
  end

  def show?
    (user.present? && user.super_user == true)
  end

  def index?
    (user.present? && user.super_user == true)
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end
end