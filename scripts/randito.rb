
def randito_string_number(len)
  o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
  (0...len).map { o[rand(o.length)] }.join
end

def randito_string(len)
  o = [('a'..'z'), ('A'..'Z'), ].map(&:to_a).flatten
  (0...len).map { o[rand(o.length)] }.join
end

puts randito_string(40)
puts randito_string(40).length
