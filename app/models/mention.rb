class Mention < ApplicationRecord
  extend Statable::ClassMethods
  include Statable::InstanceMethods

  extend Filterable::ClassMethods
  include Filterable::InstanceMethods

  extend Searchable::ClassMethods

  has_many :tweet_mentions
  has_many :tweets, :through => :tweet_mentions

  alias_attribute :user, :text 

end
