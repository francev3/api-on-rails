module Api
	module V1
		class Api::V1::UserController < ApplicationController
			before_action :set_user, only: [:show, :update]


			def show
				render :json=> {ok: true, user: @user}
			end

			def update
				if params[:password].blank?
					params.delete(:password)
				else
					@user.password_confirmation = params[:password]
				end

					
				if @user.update(user_params)
					render json: { ok: true, user: @user }, status: :ok
				else
					render json: { ok: false, errors: @user.errors }, status: :unprocessable_entity
				end
			end

			private
			# Use callbacks to share common setup or constraints between actions.
			def set_user
				@user = User.find(params[:id])
				authorize @user
			end

			# Only allow a list of trusted parameters through.
			def user_params
				params.require(:user).permit(
					:email, :password, :role, :username
				)
			end
		end
	end
end
