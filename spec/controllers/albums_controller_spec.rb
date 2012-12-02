require 'spec_helper'

describe AlbumsController do

  describe "GET new" do
    it "assigns a new album to @album" do
      xhr :get, :new
      assigns(:album).should be_a_new(Album)
    end

    it "renders the new template" do
      xhr :get, :new
      response.should render_template("new")
    end
  end

end