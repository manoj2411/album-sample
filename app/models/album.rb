class Album < ActiveRecord::Base
  attr_accessible :name, :images_attributes
  belongs_to  :user
  has_many    :images

  accepts_nested_attributes_for :images,
    :reject_if => lambda { |e| (e[:photo].blank? && e[:description].blank? && e[:tag_list].blank?)},
    :allow_destroy => true

end