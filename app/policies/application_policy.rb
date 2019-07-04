class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user

    @user = user
    @record = record
  end

  def destroy?
    belongs_to_user?
  end
end
