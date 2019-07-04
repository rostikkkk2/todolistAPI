class ExceptionErrorService
  attr_reader :attribute, :message

  def initialize(attribute, message)
    @attribute = attribute
    @message = message
  end

  def serializable_hash
    {
      source: { pointer: attribute },
      detail: message
    }
  end
end
