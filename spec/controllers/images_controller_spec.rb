require 'spec_helper'

describe ImagesController do

  describe "GET new" do
    it "assigns a new image to @image" do
      xhr :get, :new
      assigns(:image).should be_a_new(Image)
    end

    it "renders the new template" do
      xhr :get, :new
      response.should render_template("new")
    end
  end

end