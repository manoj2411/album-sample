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

  describe "GET index" do
    it "assigns images with given tag to @images" do
      image = Image.create( :photo => File.new( "#{Rails.root}/app/assets/images/rails.png"), :tag_list =>"t1, t2")
      get :index, {:tag => "t2" }
      assigns(:images).should eq([image])
    end

    it "renders the index template" do
      get :index, { :tag => "t2"}
      response.should render_template("index")
    end
  end

end