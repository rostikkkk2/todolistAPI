module StatusesHandler
  def unprocessable_entity_status
    render json: {}, status: :unprocessable_entity
  end

  def created_status(data)
    render json: data, status: :created
  end

  def ok_status(data)
    render json: data, status: :ok
  end
end
