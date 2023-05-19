class Admin < ApplicationRecord
    has_secure_password
    has_many :vehicle, dependent: :destroy


    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }
    validate :emailbait?

  EMAIL_PATTERNS = [
    /@admin.nicmotors.com/i
    # /Secret/i,
    # /Top \d/i,
    # /gmailGuess/i
  ]

  def emailbait?
    if EMAIL_PATTERNS.none? { |pat| pat.match email }
      errors.add(:email, "write the correct email address")
    end
 end

end
