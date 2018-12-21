module Assets
  class Randito
    def self.string_number(len)
      o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
      (0...len).map { o[rand(o.length)] }.join
    end

    def self.string(len)
      o = [('a'..'z'), ('A'..'Z'), ].map(&:to_a).flatten
      (0...len).map { o[rand(o.length)] }.join
    end
  end
end
