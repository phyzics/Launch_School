# med_104.rb - Protein Translation
class InvalidCodonError < StandardError; end

class Translation

  CODON = {
    'AUG'               => 'Methionine',
    %w(UUU UUC)         => 'Phenylalanine',
    %w(UUA UUG)         => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC)         => 'Tyrosine',
    %w(UGU UGC)         => 'Cysteine',
    %w(UGG)             => 'Tryptophan',
    %w(UAA UAG UGA)     => 'STOP'
  }

  def self.of_codon(codon)
    CODON.each_pair { |k,v| return v if k.include?(codon) }
    raise InvalidCodonError, "entry was not a codon"
  end

  def self.of_rna(strand)
    strands = strand.scan(/.{3}/)
    return_arr = []
    counter = 0

    loop do
      c = of_codon(strands[counter])
      break if c == 'STOP'
      return_arr << c
      counter += 1
      break if counter == strands.size
    end

    return_arr
  end
end
