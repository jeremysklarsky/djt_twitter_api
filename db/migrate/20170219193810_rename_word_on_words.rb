class RenameWordOnWords < ActiveRecord::Migration[5.0]
  def change
    rename_column :words, :word, :text
  end
end
