require 'openssl'
require_relative '../lib/assets/cipher'
require_relative '../config/initializers/constants'

def encrypt(plain_text)
  Assets::Cipher.encrypt(CONSTANTS[:key], plain_text)
end

def decrypt(plain_text)
  Assets::Cipher.decrypt(CONSTANTS[:key], plain_text)
end

puts encrypt('123')
puts decrypt('671B962CE7652B85')
