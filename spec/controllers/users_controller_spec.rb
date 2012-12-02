require 'spec_helper'

describe UsersController do

  describe "GET index" do
    it "assigns users to @users" do
      user = User.create( :name => 'u1')
      get :index
      assigns(:users).should eq([user])
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET show" do
    it "assigns the requested user to @user" do
      user = User.create( :name => 'u1')
      get :show, {:id => user.id }
      assigns(:user).should eq(user)
    end

    it "renders the show template" do
      user = User.create( :name => 'u1')
      get :show, { :id => user.id }
      response.should render_template("show")
    end

  end

  describe "GET new" do
    it "assigns a new user to @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end

    it "renders the new template" do
      get :new
      response.should render_template("new")
    end
  end

  describe "GET edit" do
    it "assigns the requested user to @user" do
      user = User.create( :name => 'u1')
      get :edit, {:id => user.id}
      assigns(:user).should eq(user)
    end

    it "renders the edit template" do
      user = User.create( :name => 'u1')
      get :edit, { :id => user.id}
      response.should render_template("edit")
    end
  end

  describe "POST create" do
    describe "with valid params" do

      it "assigns a newly created user as @user" do
        post :create, {:user =>  User.new(:name=> 'u1').attributes}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user =>  User.new(:name=> 'u1').attributes}
        response.should redirect_to(User.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create(:name=> 'u1')
        User.any_instance.should_receive(:update_attributes).with({ "name" => "u2" })
        put :update, {:id => user.id, :user => { "name" => "u2" }}
      end

      it "assigns the requested user to @user" do
        user = User.create(:name=> 'u1')
        put :update, {:id => user.id, :user => user.attributes}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        user = User.create(:name=> 'u1')
        put :update, {:id => user.id, :user => user.attributes}
        response.should redirect_to(user)
      end
    end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create(:name=> 'u1')
      expect {
        delete :destroy, {:id => user.id }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create(:name=> 'u1')
      delete :destroy, {:id => user.id }
      response.should redirect_to(users_url)
    end
  end
end

end