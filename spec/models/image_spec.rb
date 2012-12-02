require 'spec_helper'

describe Image do

  it { should belong_to( :album) }

  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }

  let ( :image) { Image.new}

  it "Name should be accessible attribute" do
    (['description', 'tags', 'photo'] - Image.accessible_attributes.to_a).should be_blank
  end

  context "Instance Methods" do
    it "Image should have a method #tag_list" do
      image.should respond_to( :tag_list)
    end

    it "#tag_list should return array of tags" do
      _img  = Image.create( :photo => File.new( "#{Rails.root}/app/assets/images/rails.png"), :tags =>"t1, t2, t3")
      (_tags = _img.tag_list).should be_kind_of( Array)
      (_tags - ["t1", "t2", "t3"]).should be_blank
    end
  end
end