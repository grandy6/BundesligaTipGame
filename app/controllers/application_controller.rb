class ApplicationController < ActionController::Base
	protect_from_forgery

end

class Encode
	def initialize
		@cipher = OpenSSL::Cipher::Cipher.new("des3")
		@cipher.encrypt # Call this before setting key or iv
		@cipher.key = 'sLwF4RG1mOXDkvLJ7d6XPEqHp5+2r2Ly'
		@cipher.iv = 'icM/yJYZyoc'
	end

	def encrypt str
		ciphertext = @cipher.update(str)
		ciphertext << @cipher.final

		encodedCipherText = Base64.encode64(ciphertext)
		return encodedCipherText
	end

	def decrypt str
		@cipher.decrypt
		plaintext = @cipher.update(Base64.decode64(str))
		plaintext << @cipher.final
	end
end