class DropNumberFromColumns3 < ActiveRecord::Migration[5.0]


  def change
    remove_column :hashtags, :number    
  end  

end
