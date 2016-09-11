class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User
  before_create :generate_authentication_token!
  before_save -> { skip_confirmation! }

  #belongs_to :role
  has_many :sales
  has_one :cart
  has_one :wishlist

  validates :auth_token, uniqueness: true
  validates :name, :email, :presence => true
  validates :email, :provider, :uniqueness => true
  #validates :role, :inclusion => roles.keys

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

  private
    def generate_authentication_token!
      begin
        self.auth_token = Devise.friendly_token
      end while self.class.exists?(auth_token: auth_token)
    end

end
