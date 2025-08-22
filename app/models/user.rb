class User < ActiveRecord::Base
  include OmniauthAttributesConcern
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:kakao, :naver, :facebook, :twitter, :apple, :google_oauth2]

  validates_presence_of :name, :email, :on => :create
  validates_length_of :email, :within => 4..255
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :password, :within => 4..255, :allow_blank => true
  has_many :user_authorizations

  def self.create_from_omniauth(params)
    self.__send__(params.provider, params)
  end
end
