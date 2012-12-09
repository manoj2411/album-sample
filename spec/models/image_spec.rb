require 'spec_helper'

describe Image do

  it { should belong_to( :album) }

  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }
  it { should have_and_belong_to_many(:tags) }
  it { should allow_mass_assignment_of(:tag_list)}
  it { should allow_mass_assignment_of(:photo)}
  it { should allow_mass_assignment_of(:description)}

  let (:image) { Image.new}

  context "Instance Methods" do

    it "Image should have a method #tag_list" do
      image.should respond_to( :tag_list)
    end

    it "#tag_list should return array of tags" do
      _img    = Image.create( :photo => File.new( "#{Rails.root}/app/assets/images/rails.png"), :tag_list =>"t1, t2, t3")
      (_tags  = _img.tag_list).should be_kind_of( Array)
      (_tags - ["t1", "t2", "t3"]).should be_blank
    end

    it "Image should have a method #tag_list=" do
      image.should respond_to( :tag_list=)
    end

    it "#tag_list= should save tags from tag_list" do
      _img          = Image.create( :photo => File.new( "#{Rails.root}/app/assets/images/rails.png"))
      _img.tag_list = "t1, t2"
      (_tags        = _img.tags.collect(&:name)).should_not be_blank
      (_tags - ["t1", "t2"]).should be_blank
    end

    it "Image should have a method #tag_names" do
      image.should respond_to( :tag_names)
    end

    it "#tag_names should return string of comma separated tags" do
      _img          = Image.create( :photo => File.new( "#{Rails.root}/app/assets/images/rails.png"))
      _img.tag_list = "t1,t2,t4"
      _img.tag_names.should eq( "t1, t2, t4")
    end


  end
end