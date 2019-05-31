module Docs
  module V1
    module Session
      extend Dox::DSL::Syntax

      document :api do
        resource 'Session' do
          endpoint '/session'
          group 'Session'
        end
      end

      document :create do
        action 'Create a session'
      end

      document :destroy do
        action 'Destroy a session'
      end
    end
  end
end
