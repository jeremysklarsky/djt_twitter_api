class RenameUsersOnMentions < ActiveRecord::Migration[5.0]
  def change
    rename_column :mentions, :user, :text
  end
end
