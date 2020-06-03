class User < ActiveRecord::Base
	before_save :downcase_fields
	has_secure_password

	def self.authenticate_with_credentials(email, password)
		user = User.find_by_email(email.strip.downcase)
		if user && user.authenticate(password)
			return user
		else 
			return nil
		end
	end

	validates :first_name, presence: true
	validates :last_name, presence: true
  validates :email, presence: true
	validates :password, presence: true, length: { minimum: 4 }
	validates :password_confirmation, presence: true, length: { minimum: 4 }
	
	def downcase_fields
		self.email.downcase!
	end
end
