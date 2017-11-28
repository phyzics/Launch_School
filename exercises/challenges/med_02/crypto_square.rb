# crypto_square.rb
class Crypto
  attr_reader :plaintext

  def initialize(message)
    @plaintext = message.scan(/[a-z\d]/i).join.downcase
  end

  def normalize_plaintext
    plaintext
  end

  def size
    square_size = Math.sqrt(plaintext.size)
    square_size.to_i == square_size ? square_size : square_size.to_i + 1
  end

  def plaintext_segments
    idx = 0
    slice_size = self.size
    segments = []
    loop do
      segments << sliced = plaintext.slice(idx, slice_size)
      break if sliced.size < slice_size
      idx += slice_size
    end
    segments.delete('')
    segments
  end

  def ciphertext
    characters = plaintext_segments.map(&:chars)
    @ciphered = characters[0].zip(*characters[1..-1]).map(&:join)
    @ciphered.join
  end

  def normalize_ciphertext
    ciphertext if !@ciphered
    @ciphered.join(' ')
  end
end
