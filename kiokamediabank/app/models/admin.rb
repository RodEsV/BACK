class Admin < ActiveRecord::Base
  # Include default devise modules.
  before_create :generate_authentication_token!, :build_default_cart,
                :build_default_whishlist

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User
  before_create :generate_authentication_token!
  before_save -> { skip_confirmation! }

  #belongs_to :role
  has_many :sales, as: :buyer
  has_one :cart, as: :cart_owner
  has_one :whishlist, as: :whishlist_owner

  validates :auth_token, uniqueness: true
  # validates :first_name, :email, :presence => true
  validates :email, :uniqueness => true
  #validates :role, :inclusion => roles.keys

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  private
    def build_default_cart
      build_cart
      true
    end

    def build_default_whishlist
      build_whishlist
      true
    end

end
