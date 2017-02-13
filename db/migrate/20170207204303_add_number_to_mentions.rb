class AddNumberToMentions < ActiveRecord::Migration[5.0]
  def change
    add_column :mentions, :number, :integer
  end
end
