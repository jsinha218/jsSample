class User < ApplicationRecord
	before_save{self.email = email.downcase}
	validates(:name,presence: true,length:{maximum:50})
	VALID_EMAIL_EXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates(:email,presence: true,length:{maximum:255},format:{with:VALID_EMAIL_EXP},uniqueness:{case_sensitive:false})
	validates(:password,length:{minimum:6},presence:true)
	has_secure_password

end