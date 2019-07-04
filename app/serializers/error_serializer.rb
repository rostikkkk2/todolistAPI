class ErrorSerializer
  attr_reader :error

  def initialize(error)
    @error = error
  end

  def to_json(_payload)
    serializable_hash.to_json
  end

  private

  def serializable_hash
    { errors: Array.wrap(error.serializable_hash).flatten }
  end
end
