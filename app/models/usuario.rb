class Usuario < ActiveRecord::Base
  attr_accessor :password

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.crypted_password = Usuario.encrypted_password(self.password, self.password_salt)
  end

  def self.authenticate(login, password)
    user = self.find_by_login(login)

    puts user.to_s
    if user
      expected_password = encrypted_password(password, user.password_salt)
      
      if user.crypted_password != expected_password
        user = nil
      end
    end
    return user
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.password_salt = self.object_id.to_s + rand.to_s
  end
end