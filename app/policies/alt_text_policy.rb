class AltTextPolicy < ApplicationPolicy

  def new?
    user.present? && user.super_user == true
  end

  def create?
    user.present? && user.super_user == true
  end

  def index?
    user.present? && user.super_user == true
  end

  def show
    user.present? && user.super_user == true
  end

  def update?
     user.present? && user.super_user == true
  end

  def destroy?
    create?
  end
end