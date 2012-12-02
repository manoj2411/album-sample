class CreateImage < ActiveRecord::Migration

  def change
    create_table :images do |t|
      t.text        :description
      t.text        :tags
      t.attachment  :photo
      t.integer     :album_id
    end
  end
end
