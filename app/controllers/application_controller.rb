class ApplicationController < ActionController::API
  before_action :ensure_json_request

  def ensure_json_request
    # return if request.headers['Accept'] =~ /json/
    return if request.headers['Accept'] =~ /vdn\.api\+json/

    render nothing: true, status: 406
  end
end
