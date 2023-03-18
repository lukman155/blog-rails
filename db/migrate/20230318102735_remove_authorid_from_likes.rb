class RemoveAuthoridFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :authorid, :integer
  end
end
