require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("schools/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("schools/show")
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @school" do
      school = create(:school)
      get :show, params: { id: school.id }
      expect(response.status).to eq(200)
    end

    it "renders the #show view" do
      school = create(:school)
      get :show, params: { id: school.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds to GET" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "responds to EDIT" do
      school = create(:school)
      get :edit, params: { id: school.id }
      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    subject { post :create, :params => { :school => attributes_for(:school) } }

    it "redirects to school_url(@school)" do
      expect(subject).to redirect_to(school_url(assigns(:school)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:school).id
    end

    it "redirects_to(@school)" do
      expect(subject).to redirect_to(assigns(:school))
    end

    it "redirects_to /schools/:id" do
      expect(subject).to redirect_to("/schools/#{assigns(:school).id}")
    end
  end

  describe 'PUT update' do
    before :each do
      @school = create(:school, name: "app_2")
    end

    context "valid attributes" do
      it "located the requested @school" do
        put :update, id: @school, contact: attributes_for(:school)
        assigns(:school).should eq(@school)
      end

      it "changes @school's attributes" do
        put :update, id: @contact,
          contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: "Smith")
        @contact.reload
        @contact.firstname.should eq("Larry")
        @contact.lastname.should eq("Smith")
      end

      it "redirects to the updated contact" do
        put :update, id: @contact, contact: Factory.attributes_for(:contact)
        response.should redirect_to @contact
      end
    end

    context "invalid attributes" do
      it "locates the requested @contact" do
        put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
        assigns(:contact).should eq(@contact)
      end

      it "does not change @contact's attributes" do
        put :update, id: @contact,
          contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: nil)
        @contact.reload
        @contact.firstname.should_not eq("Larry")
        @contact.lastname.should eq("Smith")
      end

      it "re-renders the edit method" do
        put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
        response.should render_template :edit
      end
    end
  end
end
