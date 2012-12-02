require 'spec_helper'

describe Album do

  it { should belong_to( :user) }
  it { should have_many( :images) }

  it "Name should be accessible attribute" do
    Album.accessible_attributes.to_a.should include( 'name')
  end

end