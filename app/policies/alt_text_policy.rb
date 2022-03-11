class AltTextPolicy < ApplicationPolicy

  def new?
    (user.present? && @record.user_id == user.id) && (user.present? && user.super_user == true)
  end

  def create?
    create?
  end

  def index?
    create?
  end

  def show
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end