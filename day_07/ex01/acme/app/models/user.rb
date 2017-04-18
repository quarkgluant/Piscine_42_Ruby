class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :encrypt_password
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :name, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :bio, presence: true, on: :create

  def encrypt_password
    if password.present?
      self.password = Digest::SHA2.hexdigest(password)
    end
  end

end
