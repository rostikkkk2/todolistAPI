module Docs
  module V1
    module Session
      extend Dox::DSL::Syntax

      document :api do
        resource 'Authorize::Session' do
          endpoint '/session'
          group 'Authorize'
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
