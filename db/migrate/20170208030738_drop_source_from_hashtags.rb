class DropSourceFromHashtags < ActiveRecord::Migration[5.0]
  def change
    remove_column :hashtags, :source
  end
end
