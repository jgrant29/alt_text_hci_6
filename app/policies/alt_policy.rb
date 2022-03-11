class AltPolicy < ApplicationPolicy

  def new?
    #(user.present? && @record.user_id == user.id) || (user.present? && user.super_user == true) 
    true
  end

  def create?
    #(user.present? || !user.present?) && create?
    true
  end

  def update?
    (user.present? || !user.present?) && create?
  end

  def destroy?
    create?
  end
end