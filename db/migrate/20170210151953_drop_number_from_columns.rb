class DropNumberFromColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :mentions, :number    
  end   
end
