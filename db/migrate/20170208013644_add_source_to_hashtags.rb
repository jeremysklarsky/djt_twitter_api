class AddSourceToHashtags < ActiveRecord::Migration[5.0]
  def change
    add_column :hashtags, :source, :integer    
  end
end
