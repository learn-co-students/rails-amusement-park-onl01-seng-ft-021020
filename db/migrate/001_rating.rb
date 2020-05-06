class Rating < ActiveRecord::Migration[5.2]
  def change
    create_table :rating do |t|
      t.string :commit
      t.boolean :agree
       
      t.timestamps
    end
  end
end