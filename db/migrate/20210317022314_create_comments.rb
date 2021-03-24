class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.regerences  :tweet,null: false, foreign_key: true 
      t.regerences  :user,null: false, foreign_key: true 
      t.string      :text,null: false,null: false

      t.timestamps
    end
  end
end
