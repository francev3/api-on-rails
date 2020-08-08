class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  validates :username, presence: true, uniqueness: true, length: {minimum:6, maximum:20}
  validates :role, presence: true, :inclusion => 1..3


  ROLES = {1=>'Administrador', 2=>'Rol1', 3=>'Rol2'}

  def get_role
    return ROLES[role]
  end

  def is(rol)
    return ROLES.key(rol) == role
  end
end
