class PositionTaskService
  attr_reader :params, :current_task

  POSITION_ACTIONS = {
    up: 'up',
    down: 'down'
  }.freeze

  def initialize(current_task, params)
    @params = params
    @current_task = current_task
  end

  def call
    update_position if current_task
  end

  def update_position
    case params[:position]
    when POSITION_ACTIONS[:up] then current_task.move_higher
    when POSITION_ACTIONS[:down] then current_task.move_lower
    end
  end
end
