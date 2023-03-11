class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorid
      t.string :title
      t.string :text
      t.integer :commentscounter
      t.integer :likescounter
      t.references :author, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
