class RemovePostidFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :postid, :integer
  end
end
