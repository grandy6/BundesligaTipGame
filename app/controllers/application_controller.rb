class ApplicationController < ActionController::Base
	protect_from_forgery

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user && current_user.role?(:admin)
  end
  #Todo: Adminrolle checken 
	def initialize
    @setting = Setting.first
    super
	end

  def after_sign_in_path_for(resource)
      start_path
  end

  rescue_from CanCan::AccessDenied do |exception|
  	# Hier wird konfigutiert wo nach der Exception (Von CanCan)
  	# hingesprungen wird.
    if user_signed_in?
      redirect_to start_index_path, :alert => exception.message 
  	else
  		redirect_to root_url, :alert => exception.message
  	end
	end
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
