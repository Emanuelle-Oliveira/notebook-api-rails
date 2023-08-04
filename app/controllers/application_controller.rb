class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request

  def ensure_json_request
    # return if request.headers['Accept'] =~ /json/

    unless request.headers['Accept'] =~ /vdn\.api\+json/
      render nothing: true, status: 406
    else
      unless request.get?
        return if request.headers['Content-Type'] =~ /vdn\.api\+json/
        render nothing: true, status: 415
      end
    end
  end
end
