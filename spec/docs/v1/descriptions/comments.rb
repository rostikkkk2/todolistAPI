module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Task::Comments' do
          endpoint 'task/comment'
          group 'Task::Comments'
        end
      end

      document :create do
        action 'Create a comment'
      end

      document :destroy do
        action 'Destroy a comment'
      end
    end
  end
end
