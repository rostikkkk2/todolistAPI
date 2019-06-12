module Docs
  module V1
    module Position
      extend Dox::DSL::Syntax

      document :api do
        resource 'Task::Position' do
          endpoint 'task/position'
          group 'Task::Position'
        end
      end

      document :update do
        action 'Update a position task'
      end
    end
  end
end
