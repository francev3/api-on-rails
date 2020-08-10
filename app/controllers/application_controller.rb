class ApplicationController < ActionController::API
	include Pundit

	before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

    
    
  private

  def user_not_authorized
		render json: { ok: false, message: I18n.t("pundit.default")}, status: :unauthorized
  end

  def handle_error(e)
    render json: { ok: false, message: I18n.t("not_found") }, status: :not_found
  end


end
