class AltPolicy < ApplicationPolicy

  def new?
    (user.present? && @record.user_id == user.id) || (user.present? && user.super_user == true) || (user.present? == false)
  end

  def create?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end