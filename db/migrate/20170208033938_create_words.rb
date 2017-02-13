class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|

      t.timestamps
      t.string :word
      t.integer :number
    end
  end
end
