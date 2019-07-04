class PositionTaskService
  attr_reader :params, :current_task, :error

  POSITION_ACTIONS = {
    up: 'up',
    down: 'down'
  }.freeze

  def initialize(current_task, params)
    @params = params
    @current_task = current_task
  end

  def call
    validate_params

    update_position unless error
  end

  def validate_params
    @error = I18n.t('message.wrong_params_position') unless POSITION_ACTIONS.value?(params[:position])
  end

  def update_position
    params[:position] == POSITION_ACTIONS[:up] ? current_task.move_higher : current_task.move_lower
  end
end
