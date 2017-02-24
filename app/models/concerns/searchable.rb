module Searchable

  module ClassMethods
    def search(text)
      self.where("text LIKE ?", "%#{text}%") 
    end
  end
end
