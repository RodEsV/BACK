class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }

  belongs_to :role
  has_many :sales
  has_one :cart
  has_one :wishlist

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

end
