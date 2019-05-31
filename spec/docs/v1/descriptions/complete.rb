module Docs
  module V1
    module Complete
      extend Dox::DSL::Syntax

      document :api do
        resource 'Complete' do
          endpoint '/complete'
          group 'Complete'
        end
      end

      document :update do
        action 'Update a complete task'
      end
    end
  end
end
