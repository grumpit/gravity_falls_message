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
    when 'caesar' then Cipher.caesar(message, options)
    when 'vigenere' then Cipher.vigenere(message, options)
    end
  end
  
  def self.encode message, cipher, options={}
    message = message.split(//) if cipher != 'binary'

    case cipher
    when 'a1z26' then Cipher.a1z26(message, true)
    when 'atbash' then Cipher.atbash(message, true)
    when 'binary' then Cipher.binary(message, true)
    when 'caesar' then Cipher.caesar(message, options.merge(encode: true))
    when 'vigenere' then Cipher.vigenere(message, options.merge(encode: true))
    end
  end
  
end
