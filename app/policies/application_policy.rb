class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user

    @user = user
    @record = record
  end

  def create?
    belongs_to_user?
  end

  def update?
    belongs_to_user?
  end

  def destroy?
    belongs_to_user?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError unless user

      @user = user
      @scope = scope
    end
  end
end
