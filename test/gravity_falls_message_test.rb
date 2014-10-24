class GravityFallsMessageTest < Minitest::Test
  
  def setup
    @a1z26_crypts = {
      "14-5-24-20 21-16: \"6-15-15-20-2-15-20 20-23-15: 7-18-21-14-11-12-5'19 7-18-5-22-5-14-7-5.\"" => "NEXT UP: \"FOOTBOT TWO: GRUNKLE'S GREVENGE.\"",
      "18-5-22-5-18-19-5 20-8-5 3-9-16-8-5-18-19" => "REVERSE THE CIPHERS",
      "8-1-16-16-25 14-15-23, 1-18-9-5-12?" => "HAPPY NOW, ARIEL?"
    }
    
    @atbash_crypts = {
      "MLG S.T. DVOOH ZKKILEVW." => "NOT H.G. WELLS APPROVED.",
      "KFIV VMVITB, MLG HPRM ZMW YLMV" => "PURE ENERGY, NOT SKIN AND BONE",
      "IRHRMT ORPV GSV HSVKZIW GLMV" => "RISING LIKE THE SHEPARD TONE"
    }
    
    @binary_crypts = {
      "0101000001010101" => "PU", "01010000010101010101010000100000010000010100110001001100001000000101001101001001010110000010000001010000010010010100010101000011010001010101001100100000010101000100111101000111010001010101010001001000010001010101001000100001" => "PUT ALL SIX PIECES TOGETHER!"
    }
        
    @caesar_crypts = {
      'ZLGGOH' => 'WIDDLE',
      'VKLIWHU' => 'SHIFTER',
      'ZKDWHYV' => 'WHATEVS',
      'EHDUR' => 'BEARO'
    }
    
    @vigenere_crypts = [
      {
        key: 'SHIFTER',
        cryptogram: 'OOIY DMEV VN IBWRKAMW BRUWLL',
        solution: 'WHAT KIND OF DISASTER INDEED'
      },
      {
        key: 'BEARO',
        cryptogram: 'BRTYMEMNX QBR HRRQPEE',
        solution: 'ANTHYDING CAN HADPLEN'
      }
    ]
  end
  
  should "decode a message using the a1z26 cipher" do
    @a1z26_crypts.each_pair do |cryptogram, solution|
      assert_equal solution, GravityFallsMessage.decode(cryptogram, 'a1z26')
    end
  end
  
  should "decode a message using the atbash cipher" do
    @atbash_crypts.each_pair do |cryptogram, solution|
      assert_equal solution, GravityFallsMessage.decode(cryptogram, 'atbash')
    end
  end
  
  should "decode a message using binary" do
    @binary_crypts.each_pair do |cryptogram, solution|
      assert_equal solution, GravityFallsMessage.decode(cryptogram, 'binary')
    end
  end
  
  should "decode a message using the caesar cipher" do
    @caesar_crypts.each_pair do |cryptogram, solution|
      assert_equal solution, GravityFallsMessage.decode(cryptogram, 'caesar')
    end
  end
  
  should "decode a message using the vigenere cipher" do
    @vigenere_crypts.each do |crypt|
      assert_equal crypt[:solution], GravityFallsMessage.decode(crypt[:cryptogram], 'vigenere', {key: crypt[:key]})
    end
  end
  
  
  should "encode a message using the a1z26 cipher" do
    @a1z26_crypts.each_pair do |cryptogram, solution|
      assert_equal cryptogram, GravityFallsMessage.encode(solution, 'a1z26')
    end
  end
  
  should "encode a message using the atbash cipher" do
    @atbash_crypts.each_pair do |cryptogram, solution|
      assert_equal cryptogram, GravityFallsMessage.encode(solution, 'atbash')
    end
  end
  
  should "encode a message using binary" do
    @binary_crypts.each_pair do |cryptogram, solution|
      assert_equal cryptogram, GravityFallsMessage.encode(solution, 'binary')
    end
  end
  
  should "encode a message using the caesar cipher" do
    @caesar_crypts.each_pair do |cryptogram, solution|
      assert_equal cryptogram, GravityFallsMessage.encode(solution, 'caesar')
    end
  end
  
  should "encode a message using the vigenere cipher" do
    @vigenere_crypts.each do |crypt|
      assert_equal crypt[:cryptogram], GravityFallsMessage.encode(crypt[:solution], 'vigenere', {key: crypt[:key]})
    end
  end
  
end