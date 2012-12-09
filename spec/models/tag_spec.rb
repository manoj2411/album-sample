require 'spec_helper'

describe Tag do

  it { should have_and_belong_to_many( :images) }

  it "Name should be accessible attribute" do
    Tag.accessible_attributes.to_a.should include( 'name')
  end

  context "Ensure validations" do
    let (:tag) { Tag.new( :name => "tag1")}

    it "Tag should have validation for uniqueness of name" do
      tag.should validate_uniqueness_of(:name)
    end

    it "Tag should have validation for presence of name" do
      tag.should validate_presence_of(:name)
    end

  end

end