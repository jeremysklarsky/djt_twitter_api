class SourceWord < ApplicationRecord
  belongs_to :word
  belongs_to :source
end
