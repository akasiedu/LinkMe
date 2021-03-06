class Company < ActiveRecord::Base 
  has_many :apply
  has_many :job
	attr_accessor :remember_token
	before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }


   # Returns the hash digest of the given string.
  def Company.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  #Returns a random token
  def Company.new_token
  	SecureRandom.urlsafe_base64
  end

   # Remembers a company in the database for use in persistent sessions.
  def remember
    self.remember_token = Company.new_token
    update_attribute(:remember_digest, Company.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a company.
  def forget
    update_attribute(:remember_digest, nil)
  end
end