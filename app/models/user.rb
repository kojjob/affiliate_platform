class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  enum :role, { trader: 0, affiliate: 1, admin: 2 }

  # Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true
  validates :website_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }, allow_blank: true
  validates :promo_code, length: { maximum: 20 }, allow_blank: true

  # Callbacks
  before_validation :set_default_role, on: :create
  after_create :setup_affiliate_profile, if: :affiliate?

  # Scopes
  scope :affiliates, -> { where(role: :affiliate) }
  scope :traders, -> { where(role: :trader) }
  scope :active, -> { where(active: true) }

  # Instance methods
  def full_name
    "#{first_name} #{last_name}".strip
  end

  def initials
    "#{first_name&.first}#{last_name&.first}".upcase
  end

  def display_name
    full_name.present? ? full_name : email.split("@").first
  end

  # Virtual attribute for join_affiliate_program checkbox
  attr_accessor :join_affiliate_program

  private

  def set_default_role
    # If join_affiliate_program is checked or not specified, default to affiliate
    if join_affiliate_program.present? && join_affiliate_program != "false"
      self.role = :affiliate
    else
      self.role = :trader if role.blank?
    end
  end

  def setup_affiliate_profile
    # Create any additional affiliate-specific setup here
    # For example, create an affiliate profile, set initial commission rates, etc.
  end
end
