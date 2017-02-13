class CreateSourceWords < ActiveRecord::Migration[5.0]
  def change
    create_table :source_words do |t|

      t.timestamps
      t.integer :word_id
      t.integer :source_id      
      t.integer :year
    end
  end
end
