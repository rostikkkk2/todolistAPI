class PositionTaskService
  attr_reader :params, :current_task, :error

  POSITION_ACTIONS = {
    up: 'up',
    down: 'down'
  }.freeze

  def initialize(current_task, params)
    @params = params
    @current_task = current_task
    @error = I18n.t('message.wrong_params_position') unless valid_params?
  end

  def call
    return if error

    update_position if current_task
  end

  def valid_params?
    POSITION_ACTIONS.include?(params[:position].to_sym)
  end

  def update_position
    params[:position].include?(POSITION_ACTIONS[:up]) ? current_task.move_higher : current_task.move_lower
  end
end
