class UserPolicy < ApplicationPolicy
  def show?
    super || record == user
  end
end
