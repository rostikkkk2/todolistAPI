class EntityErrorService
  attr_reader :errors, :status

  def initialize(status, errors)
    @status = status
    @errors = errors
  end

  def serializable_hash
    {
      source: { pointer: 'data/attributes' },
      detail: errors
    }
  end
end
