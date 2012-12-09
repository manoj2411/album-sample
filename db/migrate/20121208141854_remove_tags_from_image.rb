class RemoveTagsFromImage < ActiveRecord::Migration
  def up
    remove_column :images, :tags
  end

  def down
    add_column :images, :tags, :string
  end
end
