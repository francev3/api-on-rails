class SessionsController < Devise::SessionsController
	include Devise::Controllers::Helpers
	prepend_before_action :require_no_authentication, only: [:create]
	respond_to :json

	def create
    resource = User.find_for_database_authentication(:username => params[:username])
    return failure unless resource

    if resource.valid_password?(params[:password])
			sign_in(resource_name, resource)
			yield resource if block_given? 

      render :json=> {ok: true, token: current_token}
      return
    end
    failure
  end

  def failure
    return render json: { ok: false, errors: 'Usuario o contraseña no válidos'}, :status => :unauthorized
  end


	private

	def current_token
			request.env['warden-jwt_auth.token']
	end

	def respond_to_on_destroy
			head :no_content
	end
end