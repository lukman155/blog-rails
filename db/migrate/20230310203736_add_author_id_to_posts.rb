class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :authorid, :integer
    add_index :posts, :authorid
  end
end
