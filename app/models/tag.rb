class Tag < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :images

  validates :name, presence: true, uniqueness: true
end