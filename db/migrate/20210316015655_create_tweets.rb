class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string        :text,null: false     
      t.string        :file,null: false 
      t.references    :user,null: false, foreign_key: true 
      t.integer       :check_id,null: false 
      t.timestamps
    end
  end
end
