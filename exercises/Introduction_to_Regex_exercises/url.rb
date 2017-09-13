# url.rb
def url?(string)
  puts string.match?(/\Ahttps?:\/\/\S+(\.com)\z/)
end

url?('http://launchschool.com')   # -> true
url?('https://example.com')       # -> true
url?('https://example.com hello') # -> false
url?('   https://example.com')    # -> false
