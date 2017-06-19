class User < ApplicationRecord
  has_secure_password

  def output
    puts "We're in the User model."
  end
end
