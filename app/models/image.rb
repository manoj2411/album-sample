class Image < ActiveRecord::Base
  attr_accessible :description, :photo, :tag_list
  attr_accessor :tag_list

  belongs_to :album
  has_and_belongs_to_many :tags

  has_attached_file :photo, :styles => { :thumb => "100x100>", :medium => "250x250>"  }
  validates :photo, :attachment_presence => true

  before_save :ensure_tags

  def tag_list
    @tag_list || tags.collect(&:name)
  end

  def tag_list=( _list)
    @tag_list = _list.split(",").collect(&:strip).flatten.compact.uniq
    ensure_tags
  end

  def tag_names
    tag_list.join(", ")
  end

  private
  def ensure_tags
    if( @tag_list.present? )
      self.tags = tag_list.collect{ |e| Tag.find_or_create_by_name( e)}
    end
  end

end