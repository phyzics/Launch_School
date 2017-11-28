# easy_105.rb - Encrypted Pioneers
KEY = {
  'a' => 'n',
  'b' => 'o',
  'c' => 'p',
  'd' => 'q',
  'e' => 'r',
  'f' => 's',
  'g' => 't',
  'h' => 'u',
  'i' => 'v',
  'j' => 'w',
  'k' => 'x',
  'l' => 'y',
  'm' => 'z',
  'n' => 'a',
  'o' => 'b',
  'p' => 'c',
  'q' => 'd',
  'r' => 'e',
  's' => 'f',
  't' => 'g',
  'u' => 'h',
  'v' => 'i',
  'w' => 'j',
  'x' => 'k',
  'y' => 'l',
  'z' => 'm',
}

def decrypt(name)
  arr = name.chars

  arr.map! do |c|
    if c =~ /[^a-zA-Z]/
      c
    elsif c.downcase != c
      KEY[c.downcase].upcase
    else
      KEY[c]
    end
  end

  arr.join
end

p decrypt("Nqn Ybirynpr")
p decrypt("Tenpr Ubccre")
p decrypt("Nqryr Tbyqfgvar")
p decrypt("Nyna Ghevat")
p decrypt("Puneyrf Onoontr")
p decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decrypt("Wbua Ngnanfbss")
p decrypt("Ybvf Unvog")
p decrypt("Pynhqr Funaaba")
p decrypt("Fgrir Wbof")
p decrypt("Ovyy Tngrf")
p decrypt("Gvz Orearef-Yrr")
p decrypt("Fgrir Jbmavnx")
p decrypt("Xbaenq Mhfr")
p decrypt("Fve Nagbal Ubner")
p decrypt("Zneiva Zvafxl")
p decrypt("Lhxvuveb Zngfhzbgb")
p decrypt("Unllvz Fybavzfxv")
p decrypt("Tregehqr Oynapu")
=begin
- make a hash where string's are symbols to the chars 13 ahead
- chars, map, join
  - if " " then " "

=end
