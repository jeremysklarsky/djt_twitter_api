class DropYearFromHashtags < ActiveRecord::Migration[5.0]
  def change
    remove_column :hashtags, :year    
  end
end
