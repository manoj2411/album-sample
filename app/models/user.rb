class User < ActiveRecord::Base
  attr_accessible :name, :albums_attributes

  has_many :albums

  accepts_nested_attributes_for :albums, allow_destroy: true

end