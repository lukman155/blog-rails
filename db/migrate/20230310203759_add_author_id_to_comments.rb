class AddAuthorIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorid, :integer
    add_index :comments, :authorid
  end
end
