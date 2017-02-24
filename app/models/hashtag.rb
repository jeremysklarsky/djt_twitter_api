class Hashtag < ApplicationRecord
  extend Statable::ClassMethods
  include Statable::InstanceMethods

  extend Filterable::ClassMethods
  include Filterable::InstanceMethods

  extend Searchable::ClassMethods

  has_many :tweet_hashtags
  has_many :tweets, :through => :tweet_hashtags

end
