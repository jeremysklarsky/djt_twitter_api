class DropNumberFromColumns2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :words, :number    
  end  
end
