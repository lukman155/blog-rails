class AddAuthorIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :authorid, :integer
    add_index :likes, :authorid
  end
end
