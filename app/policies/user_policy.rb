class UserPolicy < ApplicationPolicy

	def show?
		@user.is('Administrador') || @user.id == record.id if @user.present?
	end

	def update?
		@user.is('Administrador') if @user.present?
	end

end