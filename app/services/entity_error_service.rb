class EntityErrorService
  attr_reader :errors, :status

  def initialize(status, errors)
    @status = status
    @errors = errors
  end

  def serializable_hash
    errors.messages.map do |attribute, message|
      {
        source: { pointer: "data/attributes/#{attribute}" },
        detail: message
      }
    end
  end
end
