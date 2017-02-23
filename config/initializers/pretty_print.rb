class String

  def print_sql
    new_line_words = ["SELECT", "INNER", "WHERE"]
    words = self.gsub!('"', '').split
    string = ""
    words.each do |word|
      string << "\n" if new_line_words.include?(word)
      string << (word + " ")
    end
    
    puts string
  end
end
