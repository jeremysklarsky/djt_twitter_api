class ChangeMentionDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:mentions, :number, 0)
  end
end
