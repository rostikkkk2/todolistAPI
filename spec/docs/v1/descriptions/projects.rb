module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      document :create do
        action 'Create a project'
      end

      document :update do
        action 'Update a project'
      end

      document :destroy do
        action 'Destroy a project'
      end
    end
  end
end
