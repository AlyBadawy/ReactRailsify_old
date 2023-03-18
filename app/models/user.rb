# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  self.skip_session_storage = [:http_auth, :params_auth]

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }

  has_many :allowlisted_jwt, dependent: :destroy

  def jwt_payload
    { "Provider" => "RailsReactify" }
  end
end
