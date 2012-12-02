class Image < ActiveRecord::Base
  attr_accessible :description, :photo, :tags

  belongs_to :album

  has_attached_file :photo, :styles => { :thumb => "100x100>", :medium => "250x250>"  }
  validates :photo, :attachment_presence => true

  def tag_list
    tags.split(",").collect(&:strip).compact.uniq
  end
end