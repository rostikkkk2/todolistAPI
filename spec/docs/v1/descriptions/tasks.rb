module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end

      document :create do
        action 'Create a task'
      end

      document :update do
        action 'Update a task'
      end

      document :destroy do
        action 'Destroy a task'
      end
    end
  end
end
