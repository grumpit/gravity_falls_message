require "gravity_falls_message/version"
require 'gravity_falls_message/cipher'

module GravityFallsMessage
  
  def self.decode message, cipher, options={}
    if  cipher != 'binary'
      message = cipher == 'a1z26' ? message.split(/( |\W)/) : message.split('')
    end
    # raise something if cipher == 'vigenere' && options[:key].nil?
    case cipher
    when 'a1z26' then Cipher.a1z26(message)
    when 'atbash' then Cipher.atbash(message)
    when 'binary' then Cipher.binary(message)
    when 'caesar' then Cipher.caesar(message, nil, false, options[:shift])
    when 'vigenere' then Cipher.vigenere(message, options[:key])
    end
  end
  
end
