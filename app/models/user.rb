class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :fields, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :crops, dependent: :destroy

  # バリデーション
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # コールバック
  after_create :create_default_field_and_section

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  private

  def create_default_field_and_section
    field = fields.create(name: "畑A", address: "")
    field.field_sections.create(name: "区画A") if field.present?
  end

end
