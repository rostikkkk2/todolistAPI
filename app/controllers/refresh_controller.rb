# Now you can build a refresh endpoint. To protect the endpoint use before_action authorize_refresh_request!.
# The endpoint itself should return a renewed access token.
class RefreshController < ApplicationController
  before_action :authorize_refresh_request!

  def create
    session = JWTSessions::Session.new(payload: access_payload)
    render json: session.refresh(found_token)
  end

  def access_payload
    # payload here stands for refresh token payload
    build_access_payload_based_on_refresh(payload)
  end
end
