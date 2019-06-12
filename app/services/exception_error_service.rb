class ExceptionErrorService
  attr_reader :status, :message, :id

  def initialize(status, message, id = nil)
    @status = status
    @message = message
    @id = id || ''
  end

  def serializable_hash
    {
      source: { pointer: 'data/attributes' },
      detail: message,
      id: id
    }
  end
end
