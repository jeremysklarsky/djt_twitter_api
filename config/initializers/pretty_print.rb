class String

  def print_sql
    new_line_words = ["SELECT", "INNER", "WHERE"]
    puts "------------------------------------------------------------------"
    puts self.gsub!('"', '').split.slice_before{|word| new_line_words.include?(word)}.map{|w| w.join(" ")}.join("\n")
    puts "------------------------------------------------------------------"
  end
end
