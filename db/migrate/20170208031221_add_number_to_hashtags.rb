class AddNumberToHashtags < ActiveRecord::Migration[5.0]
  def change
    add_column :hashtags, :number, :integer
  end
end
