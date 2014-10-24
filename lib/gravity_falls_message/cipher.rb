module GravityFallsMessage
  class Cipher

    def self.alphabet
      ('A'..'Z').to_a
    end
  
    def self.mapped_alphabet
      alphabet.inject({}) do |hash, el|
        hash[el] = (alphabet.index(el)+1)
        hash
      end
    end
  
    def self.a1z26 arr, encode=false
      answer = arr.collect do |c|
        if /-/ === c
          ''
        elsif /\W/ === c
          c
        else
          encode ? mapped_alphabet[c.upcase] : mapped_alphabet.key(c.to_i)
        end
      end
      encode ? answer.join('-').gsub(/-?(\s|")-/, '\1').gsub(/-(\W)-?/,'\1') : answer.join('')
    end
    
    def self.atbash arr, encode=false
      answer = arr.collect do |c|
        if /\W/ === c
          c
        else
          encode ? alphabet[alphabet.reverse.index(c.upcase)] : alphabet.reverse[alphabet.index(c.upcase)]
        end
      end
      answer.join('')
    end
    
    def self.binary input, encode=false
      if encode
        answer = input.unpack('B*')[0]
      else
        answer = ''
        (0..input.length).step(8).each {|i| answer << input[i,8].to_i(2).chr}
      end
      answer.delete("\0")
    end
    
    def self.caesar arr, encode=false, options={}
      default_shift = options[:shift] || 3
      key = options[:key].split(//) if options[:key]
      answer = arr.collect do |c|
        val = key ? alphabet.index(key[0]) : default_shift
        shift_value = encode ? val : (val * -1)
        if /\W/ === c
          c
        else
          ind = alphabet.index(c.upcase) + shift_value
          ind = ind >= 26 ? ind - 26 : ind
          key.rotate! if key
          alphabet[ind]
        end
      end
      answer.join('').upcase
    end
  
    def self.vigenere arr, encode=false, options={}
      caesar(arr, encode, options)
    end
    
  end
end