class AltPolicy < ApplicationPolicy

  def new?
    (user.present? && @record.user_id == user.id) || (user.present? && user.super_user == true) 
  end

  def create?
    create?
  end

  def update?
    (user.present? || !user.present?) && create?
  end

  def destroy?
    create?
  end
end