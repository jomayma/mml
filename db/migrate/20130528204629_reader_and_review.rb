class ReaderAndReview < ActiveRecord::Migration
  def up    
    create_table 'readers' do |t|
      t.string   'name'
      t.string   'provider'
      t.string   'uid'
      
      # Add fields that let Rails automatically keep track
      # of when readers are added or modified:
      t.timestamps
    end
    
    create_table 'reviews' do |t|  
      t.integer    'stars'
      t.text       'comments'
      t.string     'tags' #{fantasy, has, wish, read, sell ...}
      t.references 'reader'
      t.references 'book'

      # Add fields that let Rails automatically keep track
      # of when reviews are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table 'readers' # deletes the whole table and all its data!
    drop_table 'reviews' # deletes the whole table and all its data!
  end
end
