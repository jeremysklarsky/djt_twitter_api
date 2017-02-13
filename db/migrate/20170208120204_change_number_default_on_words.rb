class ChangeNumberDefaultOnWords < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:hashtags, :number, 0)
  end
end
