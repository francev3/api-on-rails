class ApplicationController < ActionController::API
	include Pundit

	before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
		render json: { ok: false, message: I18n.t("pundit.default")}, status: :unauthorized
  end
end
