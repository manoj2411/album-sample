require 'spec_helper'

describe User do

  it { should have_many( :albums) }

  it "Name should be accessible attribute" do
    User.accessible_attributes.to_a.should include( 'name')
  end
end