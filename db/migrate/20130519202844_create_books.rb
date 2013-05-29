class CreateBooks < ActiveRecord::Migration
  def up
    create_table 'books' do |t|
      t.string 'title'
      t.string 'author'
      t.text 'summary'
      
      # Add fields that let Rails automatically keep track
      # of when books are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table 'books' # deletes the whole table and all its data!
  end
end
