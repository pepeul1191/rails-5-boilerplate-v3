require 'openssl'

def encrypt(plain_text, key)
  cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
  cipher.key = Digest::SHA1.hexdigest key
  s = cipher.update(plain_text) + cipher.final

  s.unpack('H*')[0].upcase
end

def decrypt(cipher_text, key)
  cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
  cipher.key = Digest::SHA1.hexdigest key
  s = [cipher_text].pack("H*").unpack("C*").pack("c*")

  cipher.update(s) + cipher.final
end

puts plain = 'confidential'            # confidential
puts key = 'secretlksadfjaklsdfjasdlkfjalkdf'                    # secret
puts cipher = encrypt(plain, key)      # 5C6D4C5FAFFCF09F271E01C5A132BE89

#puts decrypt(cipher, 'guess')          # raises OpenSSL::Cipher::CipherError
puts decrypt(cipher, key)              # confidential
